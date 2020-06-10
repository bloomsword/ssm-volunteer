package net.dqsy.manager.controller;

import net.dqsy.manager.pojo.Account;
import net.dqsy.manager.pojo.Department;
import net.dqsy.manager.pojo.Organization;
import net.dqsy.manager.service.IDepartmentService;
import net.dqsy.manager.service.IOrganizationService;
import net.dqsy.manager.web.util.LocalizationUtil;
import net.dqsy.manager.web.util.PageUtil;
import net.dqsy.manager.web.util.ParamUtils;
import net.dqsy.manager.web.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("department")
public class DepartmentController{

    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IOrganizationService organizationService;
    @RequestMapping(value = "list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
        Account account = (Account) request.getSession().getAttribute("currentAccount");
        if (account == null) {
            ModelAndView mav = new ModelAndView("redirect:/index");
            return mav;
        }
        Organization organization = organizationService.findOrganizationByAccountId(account.getId());

        int start = ParamUtils.getIntParameter(request, "page", 1);
        int limit = ParamUtils.getIntParameter(request, "limit", 10);
        List<Department> list = departmentService.findList(organization.getId(), start, limit);
        int totalCount = departmentService.getTotalCount(organization.getId());

        String pagation = PageUtil.getPagation("/department/list", totalCount, start, limit);

        ModelAndView mav = new ModelAndView("department/list");
        mav.getModel().put("departmentList", list);
        mav.getModel().put("pageCode", pagation);
        return mav;
    }
    @RequestMapping(value = "detail")
    public void detail(HttpServletRequest request, HttpServletResponse response){
        Long departmentId = ParamUtils.getLongParameter(request, "department_id", 0L);
        if(departmentId == 0L){
            ResultUtil.fail(LocalizationUtil.getClientString("Account_22", request), response);
            return;
        }

        Department department = departmentService.findDepartmentById(departmentId);
        ResultUtil.success(department, response);
    }
    @RequestMapping(value = "update")
    public void update(HttpServletRequest request, HttpServletResponse response){
        Long department_id = ParamUtils.getLongParameter(request, "department_id", 0L);

        Department department = departmentService.findDepartmentById(department_id);
        ModelAndView mav = new ModelAndView("department/update");
        mav.getModel().put("department", department);
        return;

    }
    @RequestMapping(value = "save")
    public String save(HttpServletRequest request, HttpServletResponse response){
        Long departmentId = ParamUtils.getLongParameter(request, "department_id", 0L);
        String department_name = ParamUtils.getParameter(request, "department_name", "未设定");
        String department_function = ParamUtils.getParameter(request, "department_function", "");

        Department department = departmentService.findDepartmentById(departmentId);
        department.setName(department_name);
        department.setFunction(department_function);

        departmentService.updateDepartment(departmentId);

        return "redirect:/department/list";
    }


    @RequestMapping(value = "delete")
    public void delete(HttpServletRequest request, HttpServletResponse response){
        Long departmentId = ParamUtils.getLongParameter(request, "department_id", 0L);
        if(departmentId == 0L){
            ResultUtil.fail(LocalizationUtil.getClientString("Account_22", request), response);
            return;
        }
        departmentService.deleteById(departmentId);
        ResultUtil.success(response);

    }
    @RequestMapping("add")
    public void add(HttpServletRequest request, HttpServletResponse response){
        Account account = (Account) request.getSession().getAttribute("currentAccount");
        if (account == null) {
            ResultUtil.fail(response);
            return;
        }

        Long departmentId = ParamUtils.getLongParameter(request, "department_id", 0L);
        String departmentName = ParamUtils.getParameter(request, "department_name");
        String departmentFunction = ParamUtils.getParameter(request, "department_function");
        String departmentDescription = ParamUtils.getParameter(request, "department_description");

        Organization organization = organizationService.findOrganizationByAccountId(account.getId());
        Department department = new Department();
        department.setOrgId(organization.getId());
        department.setName(departmentName);
        department.setFunction(departmentFunction);
        department.setDescription(departmentDescription);
        department.setCreateTime(new Date());

        departmentService.save(department);

        ResultUtil.success(response);
    }
}
