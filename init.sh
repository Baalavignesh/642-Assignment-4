#!/bin/bash

# Student Survey System - Initialization Script
# SWE 642 Assignment 4
# Authors: Baalavignesh Arunachalam (G01486574), Pranav Arya (G01513979)

echo "================================================"
echo "Student Survey System - Initialization"
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

# Check Java version
echo ""
echo "Checking Java installation..."
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo "✓ Java version: $JAVA_VERSION"
else
    echo "✗ Java is not installed"
    echo "Please install Java 17 or higher"
    exit 1
fi

# Check Maven installation
echo ""
echo "Checking Maven installation..."
if command -v mvn &> /dev/null; then
    MVN_VERSION=$(mvn -version | grep "Apache Maven" | awk '{print $3}')
    echo "✓ Maven version: $MVN_VERSION"
else
    echo "✗ Maven is not installed"
    echo "Please install Maven 3.6 or higher"
    exit 1
fi

# Check Node.js installation
echo ""
echo "Checking Node.js installation..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    echo "✓ Node.js version: $NODE_VERSION"
else
    echo "✗ Node.js is not installed"
    echo "Please install Node.js 18 or higher"
    exit 1
fi

# Check npm installation
echo ""
echo "Checking npm installation..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm -v)
    echo "✓ npm version: $NPM_VERSION"
else
    echo "✗ npm is not installed"
    exit 1
fi

# Initialize Backend
echo ""
echo "================================================"
echo "Initializing Backend (Spring Boot + MySQL)"
echo "================================================"
cd backend

echo "Building backend with Maven..."
mvn clean install -DskipTests
if [ $? -eq 0 ]; then
    echo "✓ Backend built successfully"
else
    echo "✗ Backend build failed"
    exit 1
fi

cd ..

# Initialize Frontend
echo ""
echo "================================================"
echo "Initializing Frontend (Vue.js)"
echo "================================================"
cd frontend

echo "Installing frontend dependencies..."
npm install
if [ $? -eq 0 ]; then
    echo "✓ Frontend dependencies installed successfully"
else
    echo "✗ Frontend dependency installation failed"
    exit 1
fi

cd ..

# Success message
echo ""
echo "================================================"
echo "✓ Initialization Complete!"
echo "================================================"
echo ""
echo "Next Steps:"
echo "1. Start the backend:"
echo "   cd backend && mvn spring-boot:run"
echo ""
echo "2. In a new terminal, start the frontend:"
echo "   cd frontend && npm run dev"
echo ""
echo "3. Open your browser and navigate to:"
echo "   http://localhost:5173"
echo ""
echo "================================================"
