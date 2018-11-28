<?php
/**
 * Created by IntelliJ IDEA.
 * User: emcnaughton
 * Date: 11/27/18
 * Time: 5:29 PM
 */
$fileName = 'files.txt';
$file = fopen($fileName,"r");
$outputs = [];
while(! feof($file)) {
  $outputs[] = explode(',', fgets($file));
}

$splitPoint = .8;
foreach ($outputs as $output) {
  $fileResults = [];
  print_r($output);
  if (empty($output[0])) {
    continue;
  }
  $eightyFile = fopen('80' . trim($output[0]), 'w');
  fwrite($eightyFile, "starttime	seconds	ctime	dtime	ttime	wait\n");

  $twentyFile = fopen('20' . trim($output[0]), 'w');
  fwrite($twentyFile , "starttime	seconds	ctime	dtime	ttime	wait\n");

  $outPutFile = fopen(trim($output[0]),"r");

  while(! feof($outPutFile)) {
    $row = explode("\t", fgets($outPutFile));
    if ($row[0] === 'starttime') {
      continue;
    }
    if (!empty($row[0])) {
      foreach ($row as $key => $value) {
        $row[$key] = trim($value);
      }
      $fileResults[] = $row;
    }
  }
  uasort($fileResults, 'waittime');

  $eighty = round(count($fileResults) * $splitPoint);
  $eightySlice = array_slice($fileResults, 0, $eighty);


  print_r($eighty);
  echo count($fileResults) . ' in file results' . count($eightySlice) . 'in eight slice';
  foreach ($eightySlice as $fileResult) {
    fwrite($eightyFile, implode("\t", $fileResult) . "\n");
  }

  foreach (array_slice($fileResults, $eighty + 1) as $fileResult) {
    fwrite($twentyFile, implode("\t", $fileResult) . "\n");
  }

}

fclose($file);

/**
 * Sort by waittime.
 *
 * @param $a
 * @param $b
 * @return int
 */
function waittime($a, $b) {
  $a = trim($a[5]);
  $b = trim($b[5]);
  if ($a == $b) {
    return 0;
  }
  return ($a < $b) ? -1 : 1;

}