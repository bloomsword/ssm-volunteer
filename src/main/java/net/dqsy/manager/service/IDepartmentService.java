package net.dqsy.manager.service;


import net.dqsy.manager.pojo.Department;
import net.dqsy.manager.pojo.Organization;

import java.util.List;

public interface IDepartmentService {

    List<Department> findList(long orgId, int start, int limit);

    void add(Department department);

    int getTotalCount(long id);

    Department findDepartmentById(Long departmentId);

    void deleteById(Long departmentId);

    void save(Department department);

	void updateDepartment(Long departmentId);

}
