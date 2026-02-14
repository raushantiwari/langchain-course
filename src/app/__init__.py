# src/app/__init__.py
"""
LangChain Course - Production-grade LangChain Application

A comprehensive FastAPI application demonstrating best practices
for building production-ready LangChain applications.
"""

__version__ = "0.1.0"
__author__ = "Raushan Tiwari"
__email__ = "raushan.fullstack@gmail.com"
__license__ = "MIT"
__maintainer__ = "Raushan Tiwari"
__status__ = "Production"  # or "Development", "Beta"
__url__ = "https://github.com/raushantiwari/langchain-course"

# Expose main components
from .main import app
from .config import Settings, get_settings

__all__ = ["app", "Settings", "get_settings", "__version__"]
