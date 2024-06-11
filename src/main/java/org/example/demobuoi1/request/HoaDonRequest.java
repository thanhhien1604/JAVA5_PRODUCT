package org.example.demobuoi1.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HoaDonRequest {
    private Integer id;
    private Integer idKH;
    private Integer idNV;
    private Date ngayMuaHang;
    private Integer trangThai;
}
