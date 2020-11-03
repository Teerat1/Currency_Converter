Currency Converter

ใน app นี้ ผู้ใช้จะสามารถแปลงสกุลจากสกุลหนึ่ง ไปอีกสกุลหนึ่งจากทั้งหมด 10 สกุลเงิน และสามารถดูค่าเงินของสกุลเงินต่างๆในวันนี้ได้ตามที่อ้างอิงจากธนาคารกลางยุโรป ผ่านการใช้ Api


![1](https://user-images.githubusercontent.com/55950021/97936657-cca7dc00-1dae-11eb-9e07-649071851533.PNG)


1.หน้าเริ่มต้น



![2](https://user-images.githubusercontent.com/55950021/97936665-d5001700-1dae-11eb-94c0-d34a85e79370.PNG)



2.เมนูหลัก
หน้านี้คือหน้าที่ผู้ใช้จะเลือกว่าจะใช้การแปลงสกุลเงิน หรือ ไปดูค่าเงินในวันนี้





![3](https://user-images.githubusercontent.com/55950021/97936666-d598ad80-1dae-11eb-8a06-335a841b8885.PNG)




3.สกุลเงินในวันนี้
แสดงค่าเงินในวันนี้โดยสามารถเลือกดูในแต่ละสกุลเงินได้ (Euro จะมีค่าเป็น Null เมื่อเลือก EUR เนื่องจาก Api มี base เป็น eur และ ไม่ได้ให้ค่า rate มาใน list)





![4](https://user-images.githubusercontent.com/55950021/97936669-d598ad80-1dae-11eb-8be0-70c34dec700b.PNG)





4.แปลงสกุลเงิน
หน้านี้สำหรับการแปลงจากสกุลเงินต้นไปยังสกุลเงินถัดไป โดยผู้ใช้ต้องกรอกค่าลงในช่องว่างแล้วเลือกสกุลเงินต้นและสกุลเงินที่จะแปลง หลังจากนั้นกด Convert    output ก็จะออกมาในสกุลเงินใหม่
