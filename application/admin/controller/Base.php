<?php

namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
    //初始化
    public function initialize()
    {
        //如果没有登录的话，进入登录页面
        if(!session('?admin.id')){
            $this->redirect('admin/index/login');
        }
    }
}
