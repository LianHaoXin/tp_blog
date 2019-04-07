<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Article extends Model
{
    //软删除
    use SoftDelete;

    //关联栏目表
    public function cate()
    {
        return $this->belongsTo('Cate','cate_id','id');
    }

    //关联评论
    public function comments()
    {
        return $this->hasMany('Comment','article_id','id');
    }

    //添加文章
    public function add($data)
    {
        $validate = new \app\common\validate\Article();
        if(!$validate->scene('add')->check($data)){
            return $validate->getError();
        }
        $result = $this->allowField(true)->save($data);
        if($result){
            return 1;
        }else{
            return '文章添加失败！';
        }
    }

    //推荐
    public function top($data)
    {
        $validate = new \app\common\validate\Article();
        if(!$validate->scene('top')->check($data)){
            return $validate->getError();
        }
        $articleInfo = $this->find($data['id']);
        $articleInfo->is_top =$data['is_top'];
        $result = $articleInfo->save();
        if($result){
            return 1;
        }else{
            return '操作失败！';
        }
    }

    //文章编辑
    public function edit($data)
    {
        $validate = new \app\common\validate\Article();
        if(!$validate->scene('edit')->check($data)){
            return $validate->getError();
        }
        $articleInfo = $this->find($data['id']);
        $articleInfo->title     =   $data['title'];
        $articleInfo->tags      =   $data['tags'];
        $articleInfo->is_top    =   $data['is_top'];
        $articleInfo->cate_id   =   $data['cate_id'];
        $articleInfo->content   =   $data['content'];
        $result = $articleInfo->save();
        if($result){
            return 1;
        }else{
            return '文章编辑失败！';
        }
    }
}
