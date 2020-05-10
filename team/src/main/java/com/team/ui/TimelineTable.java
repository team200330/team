package com.team.ui;

import java.util.Date;
import java.util.List;

import com.team.vo.Task;
import com.team.vo.TaskList;

import lombok.Data;

@Data
public class TimelineTable {
	private int startMonth;
	private int endMonth;
	private List<TaskList> taskLists;
	
	public TimelineTable() {}
	public TimelineTable(List<TaskList> taskLists, int startMonth, int endMonth) {
		this.taskLists = taskLists; 
		this.startMonth = startMonth;
		this.endMonth = endMonth;
	} 
	
	public String toString() {
		StringBuffer table = new StringBuffer();
		int[] endDate = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		int listIdx = 0;
		int tdCnt = 1;
		Date today = new Date();
		
		for (int tr = 0; tr < 3 + taskLists.size(); tr++) {
			if (tr < 3) {
				table.append(tr == 0 ? "<tr id='month'><td class='fixed' width='250px'></td>" : tr == 1 ? "<tr id='date'><td class='fixed'></td>" : "<tr><td class='fixed'></td>");
				for (int i = startMonth - 1; i < endMonth; i++) {
					if (tr == 0) // 첫번째행 달출력
						table.append("<td colspan='" + endDate[i] + "'>2020년 " + (i + 1) + " 월</td>");
					else 	 	 // 두번째행 일출력
					for (int j = 1; j < endDate[i] + 1; j++, tdCnt++) 
						if (tr == 1) table.append("<td>"+ j +"</td>");
						else if (tr == 2) table.append("<td data-date='date-"+(i+1)+"-"+j+"'></td>");
				}
			}
			else { // 첫번째, 두번째행 아닐때 업무 출력
				// tasklist 
				table.append("<tr><td class='taskList fixed' id='list-"+taskLists.get(listIdx).getListNo()+"'><i class='fas fa-chevron-down'></i>" + taskLists.get(listIdx).getListName() + "</td>");
				for (int i = startMonth - 1; i < endMonth; i++) 
					for (int j = 1; j < endDate[i] + 1; j++) 
						table.append("<td data-date='date-"+(i+1)+"-"+j+"'></td>");
				
				table.append("</tr>");
				
				// tasklist 의 task
				for (Task t : taskLists.get(listIdx).getTasks()) {
					String tdClass = "task-" + t.getTaskNo() + " list-" + t.getListNo(); // 해당업무의 모든 날짜컬럼의 클래스 : 업무번호와 리스트번호
					String tContent = t.getContent().length() > 10 ? t.getContent().substring(0, 10) + " ..." : t.getContent();
					boolean same = false;
					
					// class=list-{list번호}-task : 업무리스트의 리스트 (업무 행의 첫번째 컬럼) 
					table.append("<tr class='task "+tdClass+"'><td class='fixed list-"+t.getListNo()+"-task'>" + tContent + "</td>");
					
					for (int i = startMonth - 1; i < endMonth; i++) { 
						Date sDate = t.getStartDate();
						Date eDate = t.getEndDate();
						
						
						for (int j = 1; j < endDate[i] + 1; j++) {
	
							if (same == true) {
								table.append("<td class='"+tdClass+"' data-date='date-"+(i+1)+"-"+j+"'></td>");		
								continue;
							}
							else if (sDate != null && eDate != null) {
								
								if (sDate.toString().equals(eDate.toString()) && j == sDate.getDate()) { 
									same = true;
									
									table.append("<td class='startdate " + tdClass+"' data-date='date-"+(i+1)+"-"+j+"'></td>");
									table.append("<td class='enddate " + tdClass+"' data-date='date-"+(i+1)+"-"+(j+1)+"'></td>");
									
									for (int k = j + 2; k < endDate[i]; k++) table.append("<td class='"+tdClass+"' data-date='date-"+(i+1)+"-"+k+"'></td>");
									
									break;
								}
								else if (sDate.getMonth() == i && sDate.getDate() == j) table.append("<td class='startdate ");	// 업무 시작날짜
								else if (sDate.getMonth() >= i && eDate.getMonth() == i && eDate.getDate() == j) table.append("<td class='enddate ");	// 업무 끝날짜
								else table.append("<td class='");															// 날짜설정 안되있을때
							} else table.append("<td class='");									
							
							table.append(tdClass+"' data-date='date-"+(i+1)+"-"+j+"'></td>");
						}
							
					}
					table.append("</tr>");
				}
			}
			
			if (tr < 3) table.append("</tr>");
			else listIdx++;
		}
		
		// 맨 마지막 비어있는 행
		table.append("<tr><td  class='fixed' ></td>");
		for (int i = startMonth - 1; i < endMonth; i++) 
			for (int j = 1; j < endDate[i] + 1; j++, tdCnt++) 
				table.append("<td data-date='date-"+(i+1)+"-"+j+"'></td>");
		
		table.append("</tr>");
		
		//table.append("<tr><td colspan='"+ tdCnt +"'></td></tr>");
		
		return table.toString();
	}
	
}
