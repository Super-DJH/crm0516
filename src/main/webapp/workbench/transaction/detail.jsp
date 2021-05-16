<%@ page import="java.util.List" %>
<%@ page import="com.Day.crm.settings.domain.DicValue" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.Day.crm.workbench.domain.Tran" %>
<%@ page import="com.sun.xml.internal.stream.StaxErrorReporter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 	request.getServerPort() + request.getContextPath() + "/";

    //阶段的List
    List<DicValue> dvList=(List<DicValue>) application.getAttribute("stageList");
    //可能性的map
    Map<String,String> pMap =(Map<String,String>)application.getAttribute("pMap");
    //准备pMap里面的所有key
    Set<String> set = pMap.keySet();
    //遍历dvList
    //准备一个分界点，该point应该等于7
    int point = 0;
    for (int i = 0; i < dvList.size(); i++) {
        //排好序的
        DicValue dv = dvList.get(i);
        String value = dv.getValue();
        //通过key拿到可能性
        String possibility = pMap.get(value);
        if ("0".equals(possibility)){
            point = i;
            break;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
<meta charset="UTF-8">

<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<style type="text/css">
.mystage{
	font-size: 20px;
	vertical-align: middle;
	cursor: pointer;
}
.closingDate{
	font-size : 15px;
	cursor: pointer;
	vertical-align: middle;
}
</style>
	
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

	//默认情况下取消和保存按钮是隐藏的
	var cancelAndSaveBtnDefault = true;
	
	$(function(){
		$("#remark").focus(function(){
			if(cancelAndSaveBtnDefault){
				//设置remarkDiv的高度为130px
				$("#remarkDiv").css("height","130px");
				//显示
				$("#cancelAndSaveBtn").show("2000");
				cancelAndSaveBtnDefault = false;
			}
		});
		
		$("#cancelBtn").click(function(){
			//显示
			$("#cancelAndSaveBtn").hide();
			//设置remarkDiv的高度为130px
			$("#remarkDiv").css("height","90px");
			cancelAndSaveBtnDefault = true;
		});
		
		$(".remarkDiv").mouseover(function(){
			$(this).children("div").children("div").show();
		});
		
		$(".remarkDiv").mouseout(function(){
			$(this).children("div").children("div").hide();
		});
		
		$(".myHref").mouseover(function(){
			$(this).children("span").css("color","red");
		});
		
		$(".myHref").mouseout(function(){
			$(this).children("span").css("color","#E6E6E6");
		});
		
		
		//阶段提示框
		$(".mystage").popover({
            trigger:'manual',
            placement : 'bottom',
            html: 'true',
            animation: false
        }).on("mouseenter", function () {
                    var _this = this;
                    $(this).popover("show");
                    $(this).siblings(".popover").on("mouseleave", function () {
                        $(_this).popover('hide');
                    });
                }).on("mouseleave", function () {
                    var _this = this;
                    setTimeout(function () {
                        if (!$(".popover:hover").length) {
                            $(_this).popover("hide")
                        }
                    }, 100);
                });

		//交易历史列表在页面展开时加载
		TranHistoryShow();
	});

	function TranHistoryShow() {

		$.ajax({
			url:"workbench/transaction/getTranHistoryListByTranId.do",
			data:{
				"tranId" : "${t.id}"
			},
			type:"get",
			dataType:"json",
			success : function (data) {
				//返回TranHistoryList
				var html = "";
				$.each(data,function (i,n) {
					html += "<tr>";
					html += "<td>"+n.stage+"</td>";
					html += "<td>"+n.money+"</td>";
					html += "<td>"+n.possibility+"</td>";
					html += "<td>"+n.expectedDate+"</td>";
					html += "<td>"+n.createTime+"</td>";
					html += "<td>"+n.createBy+"</td>";
					html += "</tr>";
				})
				$("#tranHistoryBody").html(html)

			}

		})
	}
	function changeStage(listStage,i) {
		//alert(listStage)
		//alert(i)
		$.ajax({
			url:"workbench/transaction/changeStage.do",
			data:{
				"listStage":listStage,
				"id":"${t.id}",
				"money":"${t.money}",
				"expectedDate":"${t.expectedDate}"
			},
			type:"post",
			dataType:"json",
			success : function (data) {
				//返回success:true/false,t:阶段、可能性，修改人，修改时间
				if (data.success){
					//成功后刷新信息列表

					$("#stage").html(data.t.stage)
					$("#possibility").html(data.t.possibility)
					$("#editTime").html(data.t.editTime)
					$("#editBy").html(data.t.editBy)

					//然后刷新图标展示
					changIcon(listStage,i)

				} else {
					alert("改变阶段失败")
				}
			}

		})
	}
	function changIcon(listStage,index1) {
		//当前阶段
		var stage = listStage;
		//当前阶段的可能性
		var possibility = $("#possibility").html()
		//当前阶段的下标
		var index = index1;
		//正常阶段和分阶段下标(7)
		var point = <%=point%>

		if("0"==possibility){
			//当前阶段可能性为0，前7个肯定是黑圈

			for (var i = 0; i < point; i++) {

				//----------------黑圈

				//移除当前样式
				$("#"+i).removeClass()
				//新添样式
				$("#"+i).addClass("glyphicon glyphicon-record mystage")
				//赋予颜色
				$("#"+i).css("color","#000000")
			}
			for(var i = point; i < <%=dvList.size()%>; i++){
				if(i == index){
					//------------红叉

					//移除当前样式
					$("#"+i).removeClass()
					//新添样式
					$("#"+i).addClass("glyphicon glyphicon-remove mystage")
					//赋予颜色
					$("#"+i).css("color","#FF0000")
				}else{
					//------------黑叉

					//移除当前样式
					$("#"+i).removeClass()
					//新添样式
					$("#"+i).addClass("glyphicon glyphicon-remove mystage")
					//赋予颜色
					$("#"+i).css("color","#000000")
				}
			}


		}else {
			//当前阶段可能性不是0，前7个可能绿勾，绿标，黑圈，但后两个可能是黑叉
			for (var i = 0; i < point; i++) {
				if(i < index){
					//绿勾
					//移除当前样式
					$("#"+i).removeClass()
					//新添样式
					$("#"+i).addClass("glyphicon glyphicon-ok-circle mystage")
					//赋予颜色
					$("#"+i).css("color","#90F790")


				}else if(i == index){
					//绿标
					//移除当前样式
					$("#"+i).removeClass()
					//新添样式
					$("#"+i).addClass("glyphicon glyphicon-map-marker mystage")
					//赋予颜色
					$("#"+i).css("color","#90F790")


				}else{
					//黑圈
					//移除当前样式
					$("#"+i).removeClass()
					//新添样式
					$("#"+i).addClass("glyphicon glyphicon-record mystage")
					//赋予颜色
					$("#"+i).css("color","#000000")
				}


			}
			for(var i = point; i < <%=dvList.size()%>; i++){
				//----------------黑叉
				//移除当前样式
				$("#"+i).removeClass()
				//新添样式
				$("#"+i).addClass("glyphicon glyphicon-remove mystage")
				//赋予颜色
				$("#"+i).css("color","#000000")
			}



		}
	}
	
</script>

</head>
<body>
	
	<!-- 返回按钮 -->
	<div style="position: relative; top: 35px; left: 10px;">
		<a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left" style="font-size: 20px; color: #DDDDDD"></span></a>
	</div>
	
	<!-- 大标题 -->
	<div style="position: relative; left: 40px; top: -30px;">
		<div class="page-header">
			<h3>${t.customerId}-${t.name} <small>￥${t.money}</small></h3>
		</div>
		<div style="position: relative; height: 50px; width: 250px;  top: -72px; left: 700px;">
			<button type="button" class="btn btn-default" onclick="window.location.href='edit.html';"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
			<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		</div>
	</div>

	<!-- 阶段状态 -->
	<div style="position: relative; left: 40px; top: -50px;">
        阶段&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <%
            //准备当前阶段以及当前阶段的可能性
            Tran t =(Tran) request.getAttribute("t");
            //当前阶段
            String currentStage = t.getStage();
            //当前阶段的可能性
            String currentPossibility = pMap.get(currentStage);


            if ("0".equals(currentPossibility)){
                //当前阶段可能性为0，前7个肯定是黑圈

                //开始遍历一下dvList
                for (int i = 0; i < dvList.size(); i++) {
                    DicValue dv = dvList.get(i);
                    //当前遍历到的阶段
                    String listStage = dv.getValue();
                    //当前遍历到的可能性
                    String listPossibility = pMap.get(listStage);

                    //当前遍历到的阶段如果是0，可能是红叉，可能是黑叉
                    if("0".equals(listPossibility)){
                        //如果当前遍历到的阶段是页面的当前阶段，那么就是红叉
                        if(currentStage.equals(listStage)){

                            //红叉----------------------------
                            %>
                            <span id="<%=i%>" onclick="changeStage('<%=listStage%>','<%=i%>')"
                                  class="glyphicon glyphicon-remove mystage"
                                  data-toggle="popover" data-placement="bottom"
                                  data-content="<%=dv.getText()%>" style="color: #FF0000;"></span>
                            -----------
                            <%
                		}else {
                    //如果当前遍历到的阶段不是页面的当前阶段，那么就是黑叉

                    //黑叉-----------------------------
                    %>
                    <span id="<%=i%>" onclick="changeStage('<%=listStage%>','<%=i%>')"
                          class="glyphicon glyphicon-remove mystage"
                          data-toggle="popover" data-placement="bottom"
                          data-content="<%=dv.getText()%>" style="color: #000000;"></span>
                    -----------
                    <%
                		}
            		}else {
                //当前遍历到的阶段如果不是0，一定是黑圈

                    //黑圈------------------------------
                %>
                <span id="<%=i%>" onclick="changeStage('<%=listStage%>','<%=i%>')"
                      class="glyphicon glyphicon-record mystage"
                      data-toggle="popover" data-placement="bottom"
                      data-content="<%=dv.getText()%>" style="color: #000000;"></span>
                -----------
                <%
           			 }
        		}

    		}else {
        //当前阶段可能性不是0，前7个可能绿勾，绿标，黑圈，但后两个可能是黑叉

        //这里需要先取当前阶段的下标
        int index = 0;
        for (int i = 0; i < dvList.size(); i++) {
            DicValue dv = dvList.get(i);
            String listStage = dv.getValue();
            //如果循环到了当前的阶段，取到当前阶段的下标
            if(listStage.equals(currentStage)){
                index = i;
                break;
            }
        }

        //开始遍历一下dvList
        for (int i = 0; i < dvList.size(); i++) {
            DicValue dv = dvList.get(i);
            //当前遍历到的阶段
            String listStage = dv.getValue();
            //当前遍历到的可能性
            String listPossibility = pMap.get(listStage);

            if("0".equals(listPossibility)){
                //如果遍历到了可能性为0，说明遍历到了后两个，所以是黑叉

                //黑叉---------------------------------
                %>
                <span id="<%=i%>" onclick="changeStage('<%=listStage%>','<%=i%>')"
                      class="glyphicon glyphicon-remove mystage"
                      data-toggle="popover" data-placement="bottom"
                      data-content="<%=dv.getText()%>" style="color: #000000;"></span>
                -----------
                <%
            }else {
                //如果遍历到了可能性不为0，则是前七个
                if(i<index){
                    //如果i<index,说明还没有遍历到页面的当前阶段，都是绿勾

                    //绿勾-----------------------------------
                    %>
                    <span id="<%=i%>" onclick="changeStage('<%=listStage%>','<%=i%>')"
                          class="glyphicon glyphicon-ok-circle mystage"
                          data-toggle="popover" data-placement="bottom"
                          data-content="<%=dv.getText()%>" style="color: #90F790;"></span>
                    -----------
                    <%
                }else if(i==index){
                    //如果==，说明遍历到了页面的当前阶段，是绿标

                    //绿标------------------------------------
                    %>
                    <span id="<%=i%>" onclick="changeStage('<%=listStage%>','<%=i%>')"
                          class="glyphicon glyphicon-map-marker mystage"
                          data-toggle="popover" data-placement="bottom"
                          data-content="<%=dv.getText()%>" style="color: #90F790;"></span>
                    -----------
                    <%
                }else {
                    //如果i>index，说明遍历到了当前阶段之后，是黑圈

                    //黑圈----------------------------------
                    %>
                    <span id="<%=i%>" onclick="changeStage('<%=listStage%>','<%=i%>')"
                          class="glyphicon glyphicon-record mystage"
                          data-toggle="popover" data-placement="bottom"
                          data-content="<%=dv.getText()%>" style="color: #000000;"></span>
                    -----------
                    <%
                }
            }
        }
    }



%>


<%--<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="资质审查" style="color: #90F790;"></span>
-----------
<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="需求分析" style="color: #90F790;"></span>
-----------
<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="价值建议" style="color: #90F790;"></span>
-----------
<span class="glyphicon glyphicon-ok-circle mystage" data-toggle="popover" data-placement="bottom" data-content="确定决策者" style="color: #90F790;"></span>
-----------
<span class="glyphicon glyphicon-map-marker mystage" data-toggle="popover" data-placement="bottom" data-content="提案/报价" style="color: #90F790;"></span>
-----------
<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="谈判/复审"></span>
-----------
<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="成交"></span>
-----------
<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="丢失的线索"></span>
-----------
<span class="glyphicon glyphicon-record mystage" data-toggle="popover" data-placement="bottom" data-content="因竞争丢失关闭"></span>
-------------%>
<span class="closingDate">${t.expectedDate}</span>
	</div>
	
	<!-- 详细信息 -->
	<div style="position: relative; top: 0px;">
		<div style="position: relative; left: 40px; height: 30px;">
			<div style="width: 300px; color: gray;">所有者</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${t.owner}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">金额</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${t.money}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 10px;">
			<div style="width: 300px; color: gray;">名称</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${t.customerId}-${t.name}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">预计成交日期</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${t.expectedDate}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 20px;">
			<div style="width: 300px; color: gray;">客户名称</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${t.customerId}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">阶段</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b id="stage">${t.stage}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 30px;">
			<div style="width: 300px; color: gray;">类型</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${t.type}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">可能性</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b id="possibility">${t.possibility}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 40px;">
			<div style="width: 300px; color: gray;">来源</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${t.source}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">市场活动源</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${t.activityId}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 50px;">
			<div style="width: 300px; color: gray;">联系人名称</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${t.contactsId}</b></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 60px;">
			<div style="width: 300px; color: gray;">创建者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${t.createBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">${t.createTime}</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 70px;">
			<div style="width: 300px; color: gray;">修改者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b id="editBy">${t.editBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;" id="editTime">${t.editTime}</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 80px;">
			<div style="width: 300px; color: gray;">描述</div>
			<div style="width: 630px;position: relative; left: 200px; top: -20px;">
				<b>
					${t.description}
				</b>
			</div>
			<div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 90px;">
			<div style="width: 300px; color: gray;">联系纪要</div>
			<div style="width: 630px;position: relative; left: 200px; top: -20px;">
				<b>
					${t.contactSummary}
				</b>
			</div>
			<div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 100px;">
			<div style="width: 300px; color: gray;">下次联系时间</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${t.nextContactTime}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
	</div>
	
	<!-- 备注 -->
	<div style="position: relative; top: 100px; left: 40px;">
		<div class="page-header">
			<h4>备注</h4>
		</div>
		
		<!-- 备注1 -->
		<div class="remarkDiv" style="height: 60px;">
			<img title="zhangsan" src="image/user-thumbnail.png" style="width: 30px; height:30px;">
			<div style="position: relative; top: -40px; left: 40px;" >
				<h5>哎呦！</h5>
				<font color="gray">交易</font> <font color="gray">-</font> <b>动力节点-交易01</b> <small style="color: gray;"> 2017-01-22 10:10:10 由zhangsan</small>
				<div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
				</div>
			</div>
		</div>
		
		<!-- 备注2 -->
		<div class="remarkDiv" style="height: 60px;">
			<img title="zhangsan" src="image/user-thumbnail.png" style="width: 30px; height:30px;">
			<div style="position: relative; top: -40px; left: 40px;" >
				<h5>呵呵！</h5>
				<font color="gray">交易</font> <font color="gray">-</font> <b>动力节点-交易01</b> <small style="color: gray;"> 2017-01-22 10:20:10 由zhangsan</small>
				<div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
				</div>
			</div>
		</div>
		
		<div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
			<form role="form" style="position: relative;top: 10px; left: 10px;">
				<textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"  placeholder="添加备注..."></textarea>
				<p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
					<button id="cancelBtn" type="button" class="btn btn-default">取消</button>
					<button type="button" class="btn btn-primary">保存</button>
				</p>
			</form>
		</div>
	</div>
	
	<!-- 阶段历史 -->
	<div>
		<div style="position: relative; top: 100px; left: 40px;">
			<div class="page-header">
				<h4>阶段历史</h4>
			</div>
			<div style="position: relative;top: 0px;">
				<table id="activityTable" class="table table-hover" style="width: 900px;">
					<thead>
						<tr style="color: #B3B3B3;">
							<td>阶段</td>
							<td>金额</td>
							<td>可能性</td>
							<td>预计成交日期</td>
							<td>创建时间</td>
							<td>创建人</td>
						</tr>
					</thead>
					<tbody id="tranHistoryBody">
						<%--<tr>
							<td>资质审查</td>
							<td>5,000</td>
							<td>10</td>
							<td>2017-02-07</td>
							<td>2016-10-10 10:10:10</td>
							<td>zhangsan</td>
						</tr>
						<tr>
							<td>需求分析</td>
							<td>5,000</td>
							<td>20</td>
							<td>2017-02-07</td>
							<td>2016-10-20 10:10:10</td>
							<td>zhangsan</td>
						</tr>
						<tr>
							<td>谈判/复审</td>
							<td>5,000</td>
							<td>90</td>
							<td>2017-02-07</td>
							<td>2017-02-09 10:10:10</td>
							<td>zhangsan</td>
						</tr>--%>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<div style="height: 200px;"></div>
	
</body>
</html>