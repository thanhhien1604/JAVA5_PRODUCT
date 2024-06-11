package org.example.demobuoi1.repositories.asm2;

import org.example.demobuoi1.entities.HoaDon;
import org.example.demobuoi1.entities.KhachHang;
import org.example.demobuoi1.entities.KichThuoc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonRepository2 extends JpaRepository<HoaDon, Integer> {
    List<HoaDon> findAllByTrangThai(int trangThai);
//    Page<HoaDon> findByTenContainingIgnoreCase(String valueSearch, Pageable pageable);

}
