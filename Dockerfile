# ใช้ Python 3.10 เป็นพื้นฐาน
FROM python:3.10-slim

# ตั้งค่า Working Directory
WORKDIR /code

# คัดลอกไฟล์ requirements.txt เข้ามา
COPY ./requirements.txt /code/requirements.txt

# ติดตั้งไลบรารีที่จำเป็น
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# คัดลอกไฟล์ทั้งหมดในโปรเจกต์เข้ามา
COPY . /code/app

# บอกให้ระบบรู้ว่าแอปของเราจะทำงานที่ Port 7860
EXPOSE 7860

# คำสั่งในการเปิดเซิร์ฟเวอร์
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]
