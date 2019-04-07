<?php
/**
 * Created by PhpStorm.
 * User: Lian
 * Date: 2019/1/7
 * Time: 11:04
 */

namespace app\common\validate;


use think\Validate;

class System extends Validate
{
    protected $rule = [
        'webname|网站标题'       => 'require',
        'copyright|版权信息'     => 'require'
    ];
}