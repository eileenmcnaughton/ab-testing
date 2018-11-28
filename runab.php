<?php
/**
 * Created by IntelliJ IDEA.
 * User: emcnaughton
 * Date: 11/27/18
 * Time: 3:26 PM
 */

$settings = require_once 'local_settings.php';

$defaults = [
  'url' => '/civicrm/contact/add?reset=1&action=update&cid=11863262',
  'cache_type' => 'redis',
  'attempts' => 100,
  'concurrency' => 1,
  'output' => 'tsv',
  'notes' => '',
  'iterations' => 3,
  'descriptor' => '',
];
$help = [
  'output' => 'csv|tsv',
  'url' => 'This will be hit as a logged in user. Note that code may be loaded onto the page by js in which case you want the url called by js',
  'attempts' => 'number of attempts per iteration',
  'cache_type' => 'array|redis - this is used for output information only',
  'notes' => 'any info relating to the test run',
  'iterations' => 'how many times the script will run.',
  'concurrency' => 'how many connections at once',
  'descriptor' => 'default',

];
// Just so phpstorm knows they are declared.
$url = $cache_type = $attempts = $concurrency = $output = $notes = $iterations = $descriptor = NULL;

foreach ($defaults as $key => $default) {
  echo 'Enter ' . $key . ' ' . $help[$key] . "\n Hit enter to accept the default of " . $defaults[$key] . "\n";
  $$key = trim(fgets(STDIN));
  if (!$$key) {
    $$key = $defaults[$key];
  }
}

// Set some descriptors for known urls
$descriptors = [
  '/civicrm/contact/add?reset=1&action=update&cid=11863262' => 'contact-edit',
];

if (isset($descriptors[$url]) && $descriptor === $defaults['descriptor']) {
  $descriptor = $descriptors[$url];
}

if (!$descriptor && stristr($url, 'search')) {
  $descriptor = 'contact-search';
}

$myab = "ab -k -l -C {$settings['cookie']} -E  ~/.ssh/cert.pem";
if (!empty($settings['ab_path'])) {
  $myab = $settings['ab_path'] . $myab;
}

if (substr($url, 0, 4) !== 'http') {
  $url = $settings['staging_url'] . $url;
}

$i = 0;
$files = [];
while ($i < $iterations) {
  $fileName = $descriptor  . date('YmdHis') . '-' . $cache_type . 'c' . $concurrency . 'a' . $attempts . '.' . $output;
  $outputFlag = ($output === 'tsv' ? ' -g ' : ' -e ');
  $command = $myab . ' -n ' . $attempts . ' -c ' . $concurrency . $outputFlag . $fileName . ' "' . $url . '"';
  echo $command . "\n";
  exec($command);
  $i++;
  $files[] = $fileName;
}

$fp = fopen('files.txt', 'a');
foreach ($files as $file) {
  $details = [
    'file' => $file,
  ];
  foreach (array_keys($defaults) as $key) {
    $details[$key] = $$key;
  }
  fwrite($fp, implode(',', $details)  . "\n"
  );
}
fclose($fp);