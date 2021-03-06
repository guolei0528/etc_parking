package com.project.backMng.admin.report.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.backMng.admin.report.service.IncomeReportService;
import com.project.common.tool.StringUtil;
import com.redoak.jar.base.model.ObjectMap;
import com.redoak.jar.base.model.Page;
import com.redoak.jar.base.springmvc.action.BaseController;

@Controller
@RequestMapping(value = "backMng/admin/report/Income", method = { RequestMethod.GET, RequestMethod.POST })
public class IncomeReportAction extends BaseController {

	private final static Logger log = LogManager.getLogger(IncomeReportAction.class);

	/**
	 * service
	 */
	// private MemberSaleMngService memberSaleMngService;
	private IncomeReportService incomeReportService;

	/**
	 * 展示数据列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/report", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView list(HttpServletRequest request) {
		ObjectMap queryParam = ObjectMap.newInstance();

		Page page = getPage(request);
		ModelAndView view = new ModelAndView("/jsp/backMng/admin/report/income/IncomeReport.jsp");
		// view.addObject(LIST, memberSaleMngService.findList(queryParam,
		// page));
		// 赋值流量查询的时间类型，1为自然日，2为公班日
		int date_type = 0;
		String query_date_type = request.getParameter("query_date_type");
		if (StringUtil.isEmpty(query_date_type)) {
			date_type = 1;
		} else {
			date_type = Integer.parseInt(query_date_type);
		}
		// 获得查询类型和时间
		queryParam.put("date_type", date_type);
		queryParam.putRequestString(request, "query_time_from");
		queryParam.putRequestString(request, "query_time_to");
		
		view.addObject(LIST, incomeReportService.findList(queryParam, page));
		view.addObject("queryParam", queryParam);
		view.addObject(PAGE, page);

		return view;
	}

	/**
	 * 展示数据列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ETCreport", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listEtc(HttpServletRequest request) {
		ObjectMap queryParam = ObjectMap.newInstance();
		Page page = getPage(request);
		ModelAndView view = new ModelAndView("/jsp/backMng/admin/report/income/ETCIncomeReport.jsp");
		// view.addObject(LIST, memberSaleMngService.findList(queryParam,
		// page));
		view.addObject("queryParam", queryParam);
		view.addObject(PAGE, page);

		return view;
	}

	public IncomeReportService getIncomeReportService() {
		return incomeReportService;
	}

	public void setIncomeReportService(IncomeReportService incomeReportService) {
		this.incomeReportService = incomeReportService;
	}

}
