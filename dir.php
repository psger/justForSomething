<?php
//递归遍历文件夹下所有文件
function dir_file($path, $deep = 0)
{
    $dirHandel = opendir($path);

    while(($file = readdir($dirHandel)) !== false){
      if($file !== '.' && $file !== '..'){
         echo str_repeat('-',$deep * 4) . $file."\n";
         if(is_dir($path .'/'. $file)){
           dir_file($path .'/'. $file, $deep + 1);
         }
      }
    }
    closedir($dirHandel);
}

dir_file('./Downloads');
