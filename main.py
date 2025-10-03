from fastapi import FastAPI
import json

# โหลดแคปซูลความทรงจำ (เวอร์ชันย่อ)
with open('memory_capsule.json', 'r', encoding='utf-8') as f:
    memory_capsule = json.load(f)

app = FastAPI(
    title="KDP Cloud Prototype",
    description="The Bee-Hive is now online."
)

@app.get("/")
async def root():
    """
    Endpoint หลักสำหรับตรวจสอบสถานะ
    """
    return {
        "system_status": "ONLINE",
        "capsule_id": memory_capsule.get("capsule_id"),
        "message": "Welcome, Chief Architect. The Bee-Hive is operational on the cloud."
    }
