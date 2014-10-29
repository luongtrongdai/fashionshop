package com.threed.fashionShop.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.threed.fashionShop.Utils.HibernateUtil;
import com.threed.fashionShop.pojo.Supplier;

@Repository
public class SupplierDAO {
    public List<Supplier> selectAllListSupplier() {
        List<Supplier> lstSupplier;
        Session session = HibernateUtil.getSessionFactory().openSession();

        String hql = "SELECT s.supplierId"
                + ", s.companyName"
                + ", s.address"
                + ", s.country"
                + " FROM Supplier s";
        Query query = session.createQuery(hql);

        lstSupplier = query.list();
        session.close();
        return lstSupplier;
    }
}
