<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>设计中心</title>
	
	<link href="${cssPath}/css/design/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${jsPath}/js/lib/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
	<link href="${cssPath}/css/design/animate.css" rel="stylesheet">
	<link href="${cssPath}/css/design/base.css" rel="stylesheet">	
	<link href="${jsPath}/js/lib/webuploader/webuploader.css" rel="stylesheet">
	<link href="${jsPath}/js/lib/jquery-ui/1.11.4/jquery-ui.css" rel="stylesheet">
	<link rel="stylesheet" href="${jsPath}/js/lib/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<!--颜色插件 Color picker-->
	<link href="${jsPath}/js/lib/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
	<style>
		.ui-draggable-dragging .view { display:block;}
		.ui-sortable-placeholder { outline: 1px dashed #ddd;visibility: visible!Important; border-radius: 4px;}
		.ui-sortable-placeholder  {
			height: 60px;
		    
		}
	</style>
</head>

<body>
<div class="navbar-static-side" role="navigation">
	<ul class="nav metismenu" id="side-menu">
		<li class="nav-header">
			<div class="logo-element"><i class="fa fa-wrench"></i></div>
		</li>
	</ul>
</div>

<!--顶导航-->
<div class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
	<div class="btn-group m15top m38left">
		<button id="btn-edit" class="btn btn-white btn-sm">
			<i class="fa fa-pencil-square-o"></i>
			编辑
		</button>
		<button id="btn-preview" class="btn btn-white btn-sm">
			<i class="fa fa-desktop"></i>
			预览
		</button>
		<button id="btn-clear" class="btn btn-white btn-sm">
			<i class="fa fa-square-o"></i>
			清空
		</button>
		<#--
		<button id="btn-save" class="btn btn-white btn-sm" role="button">
			<i class="fa fa-save icon-white"></i>保存
		</button>
		
		<button id="btn-global-setting" class="btn btn-white btn-sm all-body">
			<i class="fa fa-gears"></i>
			全局设置
		</button>
		-->
	</div> 
	
	<div class="btn-group m15top m25left">
		<#--
		<button id="btn-undo" class="btn btn-white btn-sm">
			<i class="fa fa-rotate-left"></i>
			撤销
		</button>
		-->
		
		<button id="btn-publish" class="btn btn-white btn-sm">
			<i class="fa fa-cloud-upload"></i>
			发布
		</button>
	</div>
	
	<div class="btn-group pull-right m15top rightcs">
		<span class="pull-right">${adminToken.nickname}</span>
		<a href="/toLogout.vhtml" class="btn btn-white btn-sm pull-right">
			<i class="fa fa-sign-in pe-rotate-90"></i>
			退出
		</a>
		<label class="pull-right m7top m10right">首页</label>
	</div>
</div>

<input id="pageId" value="${page.id}" type="hidden" />
<input id="pageType" value="${page.type}" type="hidden" />
<input id="instanceId" value="${page.instanceId}" type="hidden" />
<input id="instanceType" value="${instance.type}" type="hidden" />
<input id="currentUserId" value="${adminToken.userId}" type="hidden" />
<input id="memberId" value="${adminToken.userId}" type="hidden" />
<input id="nickname" value="${adminToken.nickname}" type="hidden" />
<div id="page-wrapper" class="wrapper wrapper-content animated fadeIn article ui-sortable" style="background-color:#F5F5F5; top: 60px; min-height: 3000px">
	
</div>

<div id="publish-layout" style="display: none"></div>
	


<div id="select-product-container" class="ui-draggable">
	<!--商品库-->
	<div id="select-product-box" class="small-chat-box fadeInRight animated">
		<div class="heading" draggable="true">引入的商品</div>
		<div id="product-box" class="content">
			<input class="page" value="1" type="hidden"/>
			<div id="product-list" class="feed-activity-list">
				<#--
				<div class="feed-element disabled">
					<a href="profile.html" class="">
						<img alt="image" class="img-circle-4 pull-left m10right" width="35" height="35" src="img/profile.jpg">
						<div class="media-body ">
							<small>Monica Smith</small><br>
							<small class="text-muted">￥245 报销比例：5%</small>
							<label class="label label-warning pull-right"><i class="fa fa-check"></i> 已添加</label>
						</div>
					</a>
				</div>
				-->
			</div>
			<div class="msg">加载中。。。</div>
		</div>
		<div id="category-box" class="fadeInRight small-chat-box-s">
			<div class="chat-users users-margin-n1 feed-activity-list srem">
				<div class="users-list ">
					<ul id="categoryTree" class="ztree"></ul>
					
				</div>
			</div>
		</div>
		<div class="form-chat">
			<div class="btn-group pull-left m5right">
				<button id="btn-all-category" data-toggle="dropdown" class="btn btn-outline btn-default btn-sm dropdown-toggle open-small-chat-s">
					<span class="fa fa-angle-left"></span>
					<span class="category-name">商品类别</span>
				</button>
			</div>
			<div class="input-group input-group-sm">
				<input id="productName" type="text" class="form-control">
				<span class="input-group-btn">
					<button id="btn-query-product" class="btn btn-primary" type="button">查询商品 </button>
				</span>
			</div>
		</div>
	</div>
	<div> <a id="small-chat" class="open-small-chat" style="display: none;"> <i class="fa fa-cubes"></i> </a> </div>
</div>

<!--设置标题属性 链接、高、内边距、外边距-->
<div class="modal fade" id="s-pharmacy-s2" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i> 设置标题属性</h3>
			</div>
			<div class="modal-body no-padding">
				<div class="hpanel hgreen no-margins">
					<div class="panel-body p2060">
						<form method="get" class="form-horizontal">
							<div class="form-group m15top">
								<div class="col-lg-2"><label class="control-label">图片链接</label></div>
								<div class="col-lg-10"><input type="text" class="form-control"></div>
							</div>
							<div class="form-group">
								<div class="col-lg-2"><label class="control-label">高度</label></div>
								<div class="col-lg-10"><input type="text" class="form-control"></div>
							</div>
							<div class="form-group">
								<div class="col-lg-2"><label class="control-label">边距</label></div>
								<div class="col-lg-10">
									<div class="col-lg-6"><input type="text" class="form-control" placeholder="上边距"></div>
									<div class="col-lg-6"><input type="text" class="form-control" placeholder="下边距"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 " data-dismiss="modal"><i class="fa fa-save"></i> 保存设置</button>
			</div>
		</div>
	</div>
</div>

<!--设置标题属性 高、内边距、外边距-->
<div id="modal-setting-image-all" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i> 设置标题属性</h3>
			</div>
			<div class="modal-body no-padding">
				<div class="hpanel hgreen no-margins">
					<div class="panel-body p2060">
						<form method="get" class="form-horizontal">
							<div class="form-group">
								<div class="col-lg-2"><label class="control-label">高度</label></div>
								<div class="col-lg-10">
									<input name="height" type="text" class="form-control" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-2"><label class="control-label">边距</label></div>
								<div class="col-lg-10">
									<div class="col-lg-6">
										<input type="text" class="form-control" placeholder="上边距">
									</div>
									<div class="col-lg-6">
										<input type="text" class="form-control" placeholder="下边距">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 btn-ok"><i class="fa fa-save"></i> 保存设置</button>
			</div>
		</div>
	</div>
</div>

<div id="modal-upload-image" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i> 上传图片</h3>
			</div>
			<div class="modal-body no-padding">
				<div class="hpanel hgreen no-margins">
					<div class="panel-body p2060">
						<form method="get" class="form-horizontal">
							<div class="form-group">
								<div class="col-lg-2"><label class="control-label">图片</label></div>
								<div class="col-lg-10" >
									<div class="filePicker">选择文件</div>
									
									<label class="control-label tip"></label>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 btn-ok"><i class="fa fa-save"></i> 开始上传</button>
			</div>
		</div>
	</div>
</div>

<!--设置标题属性 链接、高、内边距、外边距-->
<div id="modal-setting-link-image" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i> 设置广告图</h3>
			</div>
			<div class="modal-body no-padding">
				<div class="hpanel hgreen no-margins">
					<div class="panel-body p2060">
						<form class="form-horizontal">
							<div class="form-group set-height">
								<div class="col-lg-2"><label class="control-label">高度</label></div>
								<div class="col-lg-10">
									<input name="height" type="text" class="form-control validate[custom[number]" placeholder="" data-errorMsg="无效的数字">
								</div>
							</div>
							<div class="form-group m15top">
								<div class="col-lg-2"><label class="control-label">图片链接</label></div>
								<div class="col-lg-10">
									<input name="link" type="url" class="form-control validate[custom[url]" placeholder="http或者https开头" data-errorMsg="请填写正确的链接格式"/>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-2"><label class="control-label">打开方式</label></div>
								<div class="col-lg-10">
									  <select class="form-control" name="openMode">
											<option value="0">新窗口打开</option>
									 	 	<option value="1" selected="selected">当前窗口打开</option>
									</select>
								</div>
							</div>
							<#--
							<div class="form-group">
								<div class="col-lg-2"><label class="control-label">图片尺寸</label></div>
								<div class="col-lg-10"><label class="control-label">292*586</label></div>
							</div>
							-->
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 btn-ok"><i class="fa fa-save"></i> 保存设置</button>
			</div>
		</div>
	</div>
</div>

<!--全局设置 链接、高、内边距、外边距-->
<div id="modal-global-setting" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i> 全局设置</h3>
			</div>
			<div class="modal-body p2060">
				<form class="form-horizontal">
					<div class="form-group m15top">
						<div class="col-lg-2"><label class="control-label">背景颜色</label></div>
						<div class="col-lg-10">
							<input name="color" type="text" class="form-control colorpicker" value="#166339" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-2"><label class="control-label">高度</label></div>
						<div class="col-lg-10"><input type="text" class="form-control" placeholder="不填最小高度为100px"></div>
					</div>
				</form>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 btn-ok"><i class="fa fa-save"></i> 保存设置</button>
			</div>
		</div>
	</div>
</div>

<!--布局设置-->
<div id="modal-set-box" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i> 布局设置</h3>
			</div>
			<div class="modal-body p2060">
				<form class="form-horizontal">
					<div class="form-group">
						<div class="col-lg-2"><label class="control-label">高度</label></div>
						<div class="col-lg-10"><input name="height" type="text" class="form-control" placeholder="不填最小高度为100px"></div>
					</div>
				</form>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 btn-ok"><i class="fa fa-save"></i> 保存设置</button>
			</div>
		</div>
	</div>
</div>

<!--设置导航条-->
<div id="modal-setting-nav-bar" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i> 设置导航</h3>
			</div>
			<div class="modal-body no-padding">
				<div class="hpanel hgreen no-margins">
					<div class="panel-body p2060" style="height: 300px; overflow-y:scroll" >
						<form>
						<table class="table table-bordered overflow-y:scroll">
							<thead>
								<tr>
									<th>名称</th>
									<th>地址</th>
									<th>打开方式</th>
									<th>默认选中</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 btn-ok"><i class="fa fa-save"></i> 保存设置</button>
			</div>
		</div>
	</div>
</div>

<!-- 设置轮播图 -->
<div id="modal-setting-carousel" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-lg-ie8" style="margin-top: 30px">
		<div class="modal-content">
			<div class="modal-header text-left">
				<h3 class="m12top m5bottom"><i class="fa fa-gear"></i>设置轮播图</h3>
			</div>
			<div class="modal-body no-padding">
				<div class="hpanel hgreen no-margins">
					<div class="panel-body" style="min-height: 450px">
						<div class="row">
							<div class="col-lg-2">
								<div class="list-group lunbo-items">
								</div >
								<button class="btn btn-white btn-add" type="button" style="width: 100%"><i class="fa fa-plus"></i>添加一张</button>
							</div>
							<div id="edit-lunbo-item-area" class="col-lg-10">
								<div class="row">
									<ul class="nav nav-tabs pre-nav-tabs" role="tablist">
										<li role="presentation" class="active">
											<a href="#edit-lunbo-item-image" aria-controls="edit-lunbo-item-image" role="tab" data-toggle="tab">图片</a>
										</li>
									    <li role="presentation">
									    	<a class="edit-lunbo-item-link-product" href="#edit-lunbo-item-link-product" aria-controls="edit-lunbo-item-link-product" role="tab" data-toggle="tab">商品链接</a>
								    	</li>
								    	<#--
								    	<li role="presentation">
									    	<a class="edit-lunbo-item-link" href="#edit-lunbo-item-link" aria-controls="edit-lunbo-item-link" role="tab" data-toggle="tab">其他</a>
								    	</li>
								    	-->
									</ul>
								</div>
								<div class="row" style="height: 360px; overflow-y:auto;">
									<div class="tab-content">
									    <div role="tabpanel" class="tab-pane edit-image active edit-lunbo-item-image" id="edit-lunbo-item-image">
									    	<div class="container">
									    		<img />
									    	</div>
									    	<div class="filePicker m10top m15left">选择文件</div>
									    </div>
									    <div role="tabpanel" class="tab-pane" id="edit-lunbo-item-link-product">
									    	<div class="row">
												  <div class="form-group fl m20top m10left m10right" >
												    <label class="fl m8top m5right w60">商品名称</label>
												    <input id="set-lunbo-productname" type="text" class="form-control fl" name="productName" style="width:200px;">
												  </div>
												 <!-- <div class="form-group fl m20top m10right">
												    <label for="exampleInputEmail2" class="fl m8top m5right ">Email</label>
												    <input type="email" class="form-control fl" id="exampleInputEmail2" placeholder="jane.doe@example.com">
												  </div>-->
												<button class="btn btn-default m20top fl search" style="background-color:#337ab7;">搜索</button>
									    	</div>
									    	<div class="row m20top" style="overflow: hidden;">
												<div class="dp-zhuanti w700  m-style">
							                    	<ul class="dp-zhuanti-list dp-zhuanti-list-sm product-list">
							                            
							                        </ul>
							                        <div class="dp-zhuanti-row m40bottom">
							                            <div class="dp-zhuanti-fenye dp-zhuanti-fenye-sm pagination">
							                            	<!--
							                                <a href="#" class="dp-zhuanti-fenye-left disabled"></a>
							                                <a href="#" class="current">1</a>
							                                <a href="#" class="">2</a>
							                                <a href="#">3</a>
							                                <a href="#">4</a>
							                                <a href="#">5</a>
							                                <label class="fl m5top">...</label>
							                                <a href="#" class="dp-zhuanti-fenye-right"></a>
							                                -->
							                            </div>
							                        </div>
							                        <div class="layui-layer-loading loading" type="loading" times="1" showtime="0" contype="string" style="display: none">
							                        	<div class="layui-layer-content layui-layer-loading0" style="margin-left: auto; margin-right: auto;"></div>
						                        	</div>
							                    </div>
											</div>
									    </div>
									    <div role="tabpanel" class="tab-pane" id="edit-lunbo-item-link">
									    	<div class="p2060">
										    	<form class="form-horizontal">
													<div class="form-group">
														<div class="col-lg-2"><label class="control-label">自定义链接</label></div>
														<div class="col-lg-10">
															<input name="link" type="text" class="form-control link validate[custom[url]]" />
														</div>
													</div>
													<div class="form-group">
														<div class="col-lg-2"><label class="control-label">新窗口打开</label></div>
														<div class="col-lg-10">
															 <div class="checkbox ">
															      <input name="openMode" type="checkbox" style="margin-left: 0"/> 
															  </div>
														</div>
													</div>
												</form>
									    	</div>
									    </div>
								  	</div>
								 </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer text-right bg-eeeeee">
				<button type="button" class="btn btn-style-1 font-b5b8ba" data-dismiss="modal">我再想想</button>
				<button type="button" class="btn btn-navyBlue w180 btn-style-1 btn-ok"><i class="fa fa-save"></i> 保存设置</button>
			</div>
		</div>
	</div>
</div>

<!-- Mainly scripts --> 
<script src="${jsPath}/js/lib/jquery/1.9.1/jquery.min.js"></script> 
<#-- 各种能合并的插件都合并了 
<script src="${jsPath}/assets/mix.bundle_d8a74a5dd2.js"></script> 
-->
<script src="${jsPath}/js/lib/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="${jsPath}/js/lib/jquery-ui/1.11.4/jquery-ui.min.js"></script> 
  <script src="${jsPath}/js/lib/metisMenu/jquery.metisMenu.js"></script> 
  <script src="${jsPath}/js/lib/slimscroll/jquery.slimscroll.min.js"></script> 
  <script src="${jsPath}/js/lib/colorpicker/bootstrap-colorpicker.min.js"></script> 
  <script src="${jsPath}/js/lib/zTree_v3/js/jquery.ztree.core-3.5.min.js"></script> 
  <script src="${jsPath}/js/lib/validation/jquery.validationEngine-zh_CN.js"></script> 
  <script src="${jsPath}/js/lib/validation/jquery.validationEngine.js"></script> 
  <script src="${jsPath}/js/lib/jquery-slider/jquery.SuperSlide.js"></script> 
  <script src="${jsPath}/js/lib/htmlClean/jquery.htmlClean.js"></script> 
<!--aleat-->
<script src="${jsPath}/js/lib/toastr/toastr.min.js"></script>
<#--backbone相关-->
<script src="${jsPath}/js/lib/backbone/json2.js"></script>
<script src="${jsPath}/js/lib/backbone/underscore.js"></script>
<script src="${jsPath}/js/lib/backbone/backbone.js"></script>
<script src="${jsPath}/js/lib/backbone/backbone.localStorage.js"></script>
<script src="${jsPath}/js/lib/backbone/backbone.layoutmanager.js"></script>
<script src="${jsPath}/js/lib/layer-v2.0/layer.js"></script>
<#include "../common/webuploader.ftl">
<script src="${jsPath}/js/lib/shim/es5-shim.min.js"></script>
<script src="${jsPath}/js/lib/shim/es5-sham.min.js"></script>
<script src="${jsPath}/js/common/tools.js"></script>
<script src="${jsPath}/assets/index.bundle.js"></script>
<!--调用-->
<script>

		$(document).ready(function() {
			$('.colorpicker').colorpicker();
		});
		
		// Toastr options
        toastr.options = {
              "closeButton": false,
			  "debug": false,
			  "newestOnTop": true,
			  "progressBar": true,
			  "positionClass": "toast-top-center",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "4000",
			  "extendedTimeOut": "4000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
        };
		
</script>
</body>
</html>
