package org.example.demobuoi1.controllers;

import jakarta.servlet.http.HttpSession;
import org.example.demobuoi1.contants.Status;
import org.example.demobuoi1.contants.StatusHoaDon;
import org.example.demobuoi1.entities.*;
import org.example.demobuoi1.repositories.asm2.*;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/ban-hang")
public class BanHangController {
    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;
    @Autowired
    private SanPhamRepository2 sanPhamRepository;
    @Autowired
    private MauSacRepository2 mauSacRepository;
    @Autowired
    private KichThuocRepository2 kichThuocRepository;
    @Autowired
    private NhanVienRepository2 nhanVienRepository;
    @Autowired
    private HoaDonRepository2 hoaDonRepository2;

    @GetMapping("/index")
    public String sanPhamChiTiet(Model model,
                                 @RequestParam(name = "limit" , defaultValue = "5") int pageSize,
                                 @RequestParam(name = "page" , defaultValue = "1") int pageNumber) {
            Pageable p = PageRequest.of(pageNumber, pageSize);
            Page<SanPhamChiTiet> page = sanPhamChiTietRepository.findAll(p);
            int totalPages = page.getTotalPages();
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("currentPage",pageNumber);
            model.addAttribute("data",page);

            List<HoaDon> listHD = hoaDonRepository2.findAllByTrangThai(StatusHoaDon.PENDING);
            model.addAttribute("listHD", listHD);



        return "ban_hang/index";
    }

    @GetMapping("/taoHoaDon")
    public String taoHoaDon( HttpSession session){
        String tenNhanVien = (String) session.getAttribute("userName");
        NhanVien nhanVien = nhanVienRepository.findAllByTenDangNhap(tenNhanVien);
        if(tenNhanVien!=null){
            HoaDon hoaDon = new HoaDon();
            hoaDon.setNgayMuaHang(new Date());
            hoaDon.setNhanVien(nhanVien);
            hoaDon.setTongTien(0f);
            hoaDon.setTrangThai(StatusHoaDon.PENDING);

            hoaDonRepository2.save(hoaDon);
        }


        return "redirect:/ban-hang/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id){
        this.hoaDonRepository2.deleteById(id);
        return "redirect:/ban-hang/index";
    }


}
