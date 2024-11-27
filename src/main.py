from fastapi import FastAPI

from src.schemas import Task

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}



@app.post("/add_task")
async def add_task(task: Task):
    return {"data": task}
