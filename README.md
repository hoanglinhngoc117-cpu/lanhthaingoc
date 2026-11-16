# AI301 - ĐỀ ÁN 01: HỆ THỐNG AI AGENT XỬ LÝ CƠ HỘI BÁN HÀNG B2B (CÔNG TY MINH AN)

Dự án môn học **AI301 - AI Agent**: Xây dựng giải pháp AI Agent tự động hóa xử lý yêu cầu báo giá/cơ hội kinh doanh B2B từ kênh Email và Web Form cho Công ty Thiết bị & Dịch vụ Công nghệ Minh An.

---

## 📁 CẤU TRÚC THƯ MỤC DỰ ÁN

```
ây dừn qtkd1/
├── data/                                 # Dữ liệu Knowledge Base & Test Sets
│   ├── products_catalog.json             # Danh mục sản phẩm, giá niêm yết, tồn kho, SLA
│   ├── discount_policy.json              # Chính sách chiết khấu phân hạng và số lượng
│   ├── approval_matrix.json              # Ma trận phân quyền chuyển duyệt (Sales/Manager/BOD)
│   └── sample_requests.json              # Bộ dữ liệu 8 kịch bản kiểm thử mẫu
├── src/                                  # Mã nguồn Python chuẩn hóa
│   ├── config.py                         # Cấu hình đường dẫn, hằng số hệ thống
│   ├── models.py                         # Khai báo cấu trúc dữ liệu (Dataclasses & Enums)
│   ├── audit_logger.py                   # Module ghi log truy vết kiểm toán
│   ├── agent_controller.py               # Coordinator Agent điều phối quy trình
│   └── tools/                            # 4 Kỹ năng nghiệp vụ (Business Skills)
│       ├── extraction_tool.py            # Kỹ năng 1: Trích xuất thực thể & rà soát dữ liệu thiếu
│       ├── catalog_inventory_tool.py     # Kỹ năng 2: Tra cứu bảng giá mới, kiểm kho & tính lead time
│       ├── pricing_policy_tool.py        # Kỹ năng 3: Tính toán chiết khấu & ma trận chuyển duyệt
│       └── generator_tool.py             # Kỹ năng 4: Soạn thảo hồ sơ, email nháp & phiếu duyệt
├── output/                               # Kết quả tự động sinh từ hệ thống
│   ├── dossiers/                         # Hồ sơ cơ hội kinh doanh dạng Markdown
│   ├── draft_emails/                     # Bản nháp email phản hồi khách hàng
│   ├── approval_tickets/                 # Phiếu chuyển duyệt cấp quản lý
│   ├── logs/execution_audit.log          # Nhật ký Audit Trail truy vết từng bước
│   └── summary_dashboard.json            # Bảng tổng hợp số liệu JSON cho Ban Giám đốc
├── runner.ps1                            # Native Windows PowerShell Runner (Chạy trực tiếp)
├── test_runner.py                        # Script Python kiểm thử batch tự động
├── main.py                               # Entrypoint chính cho Python
├── BAOCAO_AI301_DE01_MINHAN.md           # BÁO CÁO TOÀN DIỆN CHO TASK 1 & TASK 2
└── README.md                             # Hướng dẫn sử dụng dự án
```

---

## 🚀 HƯỚNG DẪN CHẠY VÀ BẢO VỆ ĐỒ ÁN

### Cách 1: Chạy trực tiếp bằng PowerShell (Khuyên dùng trên Windows)
Không cần cài đặt thêm thư viện ngoại vi, chạy ngay lập tức:

```powershell
# Chạy với bộ test mặc định:
.\runner.ps1

# Chạy với bộ test mới của Giảng viên tại buổi thi:
.\runner.ps1 -DataFilePath "đường_dẫn_đến_file_test_mới.json"
```

### Cách 2: Chạy bằng Python (Nếu máy có Python)
```bash
# Chạy với bộ test mặc định:
python test_runner.py

# Chạy với bộ test mới của Giảng viên:
python test_runner.py "path/to/new_test_data.json"
```

---

## 📊 KẾT QUẢ TỔNG HỢP THEO QUY CHUẨN BAN GIÁM ĐỐC

| Trạng thái cơ hội | Số lượng | Tỷ lệ | Tổng giá trị (Net VNĐ) |
| :--- | :---: | :---: | :---: |
| **[1] CÓ THỂ TIẾP TỤC (`CAN_PROCEED`)** | 1 | 12.5% | 55.300.000 VNĐ |
| **[2] CẦN BỔ SUNG THÔNG TIN (`NEEDS_INFO`)** | 2 | 25.0% | 0 VNĐ |
| **[3] CHƯA ĐÁP ỨNG ĐƯỢC (`CANNOT_FULFILL`)** | 1 | 12.5% | 130.650.000 VNĐ *(Tách riêng)* |
| **[4] CHỜ PHÊ DUYỆT (`PENDING_APPROVAL`)** | 4 | 50.0% | 2.665.930.000 VNĐ |
| **TỔNG CƠ HỘI ĐỦ ĐIỀU KIỆN HOẶC CHỜ DUYỆT** | **5** | **62.5%** | **2.721.230.000 VNĐ** |

---

## 🛡️ NGUYÊN TẮC GUARDRAILS & TRUY VẾT
- **Không tự ý xác nhận bán hàng:** Khi chưa đủ thông tin hoặc vượt thẩm quyền Sales Rep, Agent tuyệt đối không sinh báo giá khẳng định mà chuyển sang trạng thái chờ duyệt hoặc yêu cầu bổ sung.
- **Minh chứng gọi công cụ:** Mọi quyết định đều có log truy vết cụ thể trong `output/logs/execution_audit.log`.
- **Xem báo cáo chi tiết:** Mở file [BAOCAO_AI301_DE01_MINHAN.md](file:///c:/Users/Admin/Downloads/%C3%A2y%20d%E1%BB%ABn%20qtkd1/BAOCAO_AI301_DE01_MINHAN.md) để đọc đầy đủ phân tích Task 1 và Task 2.

