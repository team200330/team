package com.team.common;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.json.CDL;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.service.TimelineService;
import com.team.vo.Project;
import com.team.vo.Task;
import com.team.vo.TaskList;

public class ConvertJsontoCSV {
	
	@Autowired
	@Qualifier("timelineService")
	private TimelineService timelineService;
	
	public void convert(List<Task> lists) {
		// list 를 JSON 으로 변환
		ObjectMapper mapper = new ObjectMapper(); 
		String jsonList="{\"fileName\":"; 
		try { 
			jsonList += mapper.writeValueAsString(lists);
		
		} catch (IOException e) { e.printStackTrace(); }
		
		jsonList += "}";
		//System.out.println(jsonList);
		
		// JSON 을 CSV 파일로 변환해서 Temp 경로에 쓰기
		String fileName = System.getProperty("java.io.tmpdir") + "/Project.csv";
		try {
			JSONObject output = new JSONObject(jsonList);
			JSONArray docs = output.getJSONArray("fileName");
			
			File file = new File(fileName);
			//System.out.println(file.getAbsolutePath());
			
			String csv = CDL.toString(docs);
			FileUtils.writeStringToFile(file, csv , "UTF-8");

			System.out.println("Data has been Sucessfully Writeen to "+ file);
		
		} catch(Exception e) { e.printStackTrace(); }
		
		
	}

}
