package org.example.demobuoi1.controllers;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.eclipse.tags.shaded.org.apache.xalan.xsltc.dom.SAXImpl;
import org.example.demobuoi1.contants.Status;
import org.example.demobuoi1.entities.HoaDon;
import org.example.demobuoi1.entities.KhachHang;
import org.example.demobuoi1.entities.NhanVien;

import org.example.demobuoi1.entities.SanPham;
import org.example.demobuoi1.repositories.asm2.HoaDonRepository2;
import org.example.demobuoi1.repositories.asm2.KhachHangRepository2;
import org.example.demobuoi1.repositories.asm2.NhanVienRepository2;
import org.example.demobuoi1.request.HoaDonRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {
    @Autowired
    HoaDonRepository2 hoaDonRepository;
    @Autowired
    KhachHangRepository2 khachHangRepository;
    @Autowired
    NhanVienRepository2 nhanVienRepository;

        @GetMapping("/index")
        public String index(Model model,
                            @RequestParam(name = "page", defaultValue = "0") int pageNumber,
                            @RequestParam(name = "limit", defaultValue = "5") int pageSize) {
            Pageable pageable = PageRequest.of(pageNumber, pageSize);
            Page<HoaDon> pageHoaDon = hoaDonRepository.findAll(pageable);
            model.addAttribute("data", pageHoaDon);
            model.addAttribute("currentPage",pageNumber);
            model.addAttribute("totalPages",pageHoaDon.getTotalPages());
            return "hoa_don/index";
        }

        @GetMapping("/edit/{id}")
        public String edit(@PathVariable("id") int id,
                           Model model){
            HoaDon hoaDon = hoaDonRepository.findById(id).get();
            model.addAttribute("data", hoaDon);
            model.addAttribute("khachHang", khachHangRepository.findAll());
            model.addAttribute("nhanVien", nhanVienRepository.findAll());
            return "hoa_don/edit";
        }

        @PostMapping("/update/{id}")
        public String update(HoaDonRequest hoaDonRequest) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm a", Locale.ENGLISH); // Adjust the format
            HoaDon hoaDon = hoaDonRepository.findById(hoaDonRequest.getId()).get();
            NhanVien nhanVien = nhanVienRepository.findById(hoaDonRequest.getIdNV()).get();
            KhachHang khachHang = khachHangRepository.findById(hoaDonRequest.getIdKH()).get();
            try {
                Date ngayMuaHang = formatter.parse(String.valueOf(hoaDonRequest.getNgayMuaHang()));
                hoaDon.setNgayMuaHang(ngayMuaHang);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            hoaDon.setId(hoaDon.getId());
            hoaDon.setNhanVien(nhanVien);
            hoaDon.setKhachHang(khachHang);
            hoaDon.setTrangThai(hoaDonRequest.getTrangThai());
            this.hoaDonRepository.save(hoaDon);
            return "redirect:/hoa-don/index";

        }

    public  static Map<String , String> getErrorMessages(BindingResult bindingResult){
        Map<String, String> errors = new HashMap<>();
        for (FieldError fieldError : bindingResult.getFieldErrors()) {
            errors.put(fieldError.getField(), fieldError.getDefaultMessage());
        }
        return errors;
    }


}
