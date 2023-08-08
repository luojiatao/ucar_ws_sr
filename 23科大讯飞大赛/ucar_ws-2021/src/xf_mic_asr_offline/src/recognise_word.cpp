/*
 * recognise_word.cpp
 */
#include "user_interface.h"
#include <string>
#include <locale>
#include <codecvt>
#include <ctime>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <xf_mic_asr_offline/Get_Awake_Angle_srv.h>
#include <std_msgs/Int8.h>
#include <std_msgs/Int32.h>
#include <sys/stat.h>
#include <iostream>

using namespace std;




int main(int argc, char *argv[])
{
	ros::init(argc, argv, "recognise_node");
	ros::NodeHandle nh;
	ros::service::waitForService("xf_asr_offline_node/get_awake_angle_srv");

	// 创建一个Publisher，发布名为/start_move的topic，消息类型为std_msgs::String，队列长度10
	ros::Publisher Start_move = nh.advertise<std_msgs::String>("/start_move", 10);	std_msgs::String msg;

	/*获取主麦克风角度*/
	ros::ServiceClient Get_Awake_Angle =
		nh.serviceClient<xf_mic_asr_offline::Get_Awake_Angle_srv>("xf_asr_offline_node/get_awake_angle_srv");

	xf_mic_asr_offline::Get_Awake_Angle_srv GetAwakeAngle_srv;

	string word = "no";

	while (ros::ok())
	{
		//call get_major_mic_srv
		if (Get_Awake_Angle.call(GetAwakeAngle_srv))
		{
			ROS_INFO("succeed to call service \"get_awake_angle_srv\"!");

			if (GetAwakeAngle_srv.response.result == "ok")
			{
				ROS_INFO("succeed to get response awake_angle!");

				word = "yes";
				//Start_move.publish(word);
				std_msgs::String msg;
				std::stringstream ss;
				ss << word;
				msg.data = ss.str();
				Start_move.publish(msg);
				ROS_INFO("succeed to publish topic \"Start_move\"!");
				ros::shutdown();
				
			}
			else
			{
				ROS_INFO("failed to get response awake_angle!");
				
			}
		}
		else
		{
			ROS_INFO("failed to call service \"get_awake_angle_srv\"!");
			sleep(2);
		}
	}
	
	sleep(2);


	return 0;
}







