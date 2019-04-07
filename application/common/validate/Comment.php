<?php
/**
 * Created by PhpStorm.
 * User: Lian
 * Date: 2019/1/7
 * Time: 9:52
 */

namespace app\common\validate;


use think\Validate;

class Comment extends Validate
{
    protected $rule = [
        'content|'    => 'require'
    ];
}