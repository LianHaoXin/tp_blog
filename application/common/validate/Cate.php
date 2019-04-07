<?php
/**
 * Created by PhpStorm.
 * User: Lian
 * Date: 2019/1/2
 * Time: 0:19
 */

namespace app\common\validate;


use think\Validate;

class Cate extends Validate
{
    protected $rule = [
        'catename|栏目名称' => 'require|unique:cate',
        'sort|排序'         => 'require|number'
    ];

    //栏目添加场景
    public function sceneAdd()
    {
        return $this->only(['catename','sort']);
    }

    //栏目排序场景
    public function sceneSort()
    {
        return $this->only(['sort']);
    }

    //栏目编辑场景
    public function sceneEdit()
    {
        return $this->only(['catename']);
    }
}