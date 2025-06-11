# HE THONG PHAT HIEN VA XU LY LOI (Error Detection and Handling System)

## Mô tả

Đây là một chương trình giả lập hệ thống phát hiện và xử lý các loại lỗi cơ bản trong môi trường lập trình Assembly, được viết cho EMU8086. Chương trình cung cấp một menu tương tác cho phép người dùng kiểm tra các tình huống lỗi khác nhau và xem log lỗi.

## Các loại lỗi được xử lý:

Chương trình có khả năng phát hiện và giả lập xử lý các loại lỗi sau:

1.  **Lỗi tràn số (Overflow Error)**: Kiểm tra tình huống tràn số trong phép toán.
2.  **Lỗi chia cho 0 (Division by Zero Error)**: Kiểm tra phép chia cho số 0.
3.  **Lỗi truy cập bộ nhớ không hợp lệ (Invalid Memory Access Error)**: Giả lập lỗi truy cập bộ nhớ.
4.  **Lỗi tràn Stack (Stack Overflow Error)**: Giả lập tình huống Stack bị tràn.
5.  **Lỗi Stack Underflow (Stack Underflow Error)**: Giả lập tình huống Stack bị thiếu dữ liệu.
6.  **Lỗi thanh ghi chưa khởi tạo (Uninitialized Register Error)**: Kiểm tra việc sử dụng thanh ghi CX khi chưa được khởi tạo.
7.  **Lỗi nhập ký tự đặc biệt (Special Character Input Error)**: Phát hiện khi người dùng nhập các ký tự không hợp lệ.
8.  **Lỗi tràn bộ đệm nhập liệu (Input Buffer Overflow Error)**: Kiểm tra tràn bộ đệm khi nhập chuỗi.
9.  **Lỗi lệnh không hợp lệ (Invalid Opcode Error)**: Phát hiện và xử lý các lệnh CPU không hợp lệ (theo danh sách định trước).
10. **Xem log lỗi (View Error Log)**: Hiển thị lịch sử các lỗi đã xảy ra.

Chương trình cũng bao gồm chức năng "phục hồi hệ thống" giả lập để reset các biến sau khi phát hiện lỗi.

## Cách sử dụng

1.  **Môi trường**: Chương trình được thiết kế để chạy trên giả lập **EMU8086**.
2.  **Mở file**: Mở file `final2.asm` trong EMU8086.
3.  **Compile và Run**:
    *   Nhấn `Compile` để biên dịch chương trình.
    *   Nhấn `Run` để chạy chương trình.
4.  **Tương tác**:
    *   Chương trình sẽ hiển thị một menu chính.
    *   Nhập số tương ứng với lựa chọn bạn muốn kiểm tra (từ 1 đến 11).
    *   Làm theo hướng dẫn trên màn hình cho từng chức năng.

## Cấu trúc file (`final2.asm`)

*   `.MODEL SMALL`, `.STACK 100H`, `.DATA`, `.CODE`: Các phần khai báo cơ bản của chương trình Assembly.
*   **Khu vực `.DATA`**: Chứa tất cả các biến, chuỗi thông báo, và buffer được sử dụng trong chương trình.
*   **Khu vực `.CODE`**:
    *   `MAIN PROC`: Thủ tục chính, quản lý hiển thị menu và điều hướng đến các chức năng.
    *   `OVERFLOW_TEST PROC`: Kiểm tra lỗi tràn số.
    *   `DIV_ZERO_TEST PROC`: Kiểm tra lỗi chia cho 0.
    *   `MEM_TEST PROC`: Giả lập lỗi truy cập bộ nhớ.
    *   `STACK_OVERFLOW_TEST PROC`: Giả lập lỗi tràn stack.
    *   `STACK_UNDERFLOW_TEST PROC`: Giả lập lỗi stack underflow.
    *   `REG_UNINIT_TEST PROC`: Kiểm tra lỗi thanh ghi chưa khởi tạo.
    *   `INPUT_SPECIAL_TEST PROC`: Kiểm tra lỗi nhập ký tự đặc biệt.
    *   `INPUT_OVERFLOW_TEST PROC`: Kiểm tra lỗi tràn bộ đệm nhập liệu.
    *   `INVALID_OPCODE_TEST PROC`: Kiểm tra lỗi lệnh không hợp lệ.
    *   `VIEW_LOG PROC`: Hiển thị nội dung log lỗi.
    *   **Các thủ tục hỗ trợ**: `DISPLAY_NUM`, `CONVERT_TO_ASCII`, `LOG_ERROR`, `LOG_WRITE_2DIGIT`, `WAIT_KEY`, `HEX_CHAR_TO_VAL`, `DISPLAY_HEX`, `HEX_DIGIT`, `ASK_RECOVERY`. 