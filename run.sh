#!/bin/bash

# Student Survey System - Run Script
# SWE 642 Assignment 4
# Authors: Baalavignesh Arunachalam (G01486574), Pranav Arya (G01513979)

echo "================================================"
echo "Student Survey System - Starting Application"
echo "SWE 642 Assignment 4"
echo "================================================"
echo ""

# Check if MySQL is running
echo "Checking MySQL status..."
if pgrep -x "mysqld" > /dev/null; then
    echo "✓ MySQL is running"
else
    echo "✗ MySQL is not running"
    echo "Please start MySQL before continuing."
    echo "On macOS: brew services start mysql"
    echo "On Linux: sudo systemctl start mysql"
    exit 1
fi

# Kill any existing processes on ports 8080 and 5173
echo ""
echo "Checking for processes on ports 8080 and 5173..."
lsof -ti:8080 | xargs kill -9 2>/dev/null
lsof -ti:5173 | xargs kill -9 2>/dev/null
echo "✓ Ports cleared"

# Start Backend
echo ""
echo "================================================"
echo "Starting Backend (Spring Boot) on port 8080..."
echo "================================================"
cd backend
mvn spring-boot:run &
BACKEND_PID=$!
echo "Backend started with PID: $BACKEND_PID"
cd ..

# Wait for backend to start
echo "Waiting for backend to start..."
sleep 10

# Start Frontend
echo ""
echo "================================================"
echo "Starting Frontend (Vue.js) on port 5173..."
echo "================================================"
cd frontend
npm run dev &
FRONTEND_PID=$!
echo "Frontend started with PID: $FRONTEND_PID"
cd ..

# Success message
echo ""
echo "================================================"
echo "✓ Application Started Successfully!"
echo "================================================"
echo ""
echo "Backend:  http://localhost:8080/api/surveys"
echo "Frontend: http://localhost:5173"
echo ""
echo "Backend PID:  $BACKEND_PID"
echo "Frontend PID: $FRONTEND_PID"
echo ""
echo "To stop the application, press Ctrl+C or run:"
echo "kill $BACKEND_PID $FRONTEND_PID"
echo ""
echo "================================================"

# Wait for Ctrl+C
wait
