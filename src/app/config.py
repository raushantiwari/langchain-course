import os
from pydantic_settings import BaseSettings
from functools import lru_cache
from typing import Literal


class Settings(BaseSettings):
    # Application
    app_name: str = "langchain-course"
    app_env: Literal["development", "staging", "production"] = "development"
    debug: bool = True

    # Server
    host: str = "127.0.0.1"
    port: int = 8001
    reload: bool = True
    workers: int = 1

    # Logging
    log_level: str = "INFO"

    # API Keys
    openai_api_key: str = ""

    class Config:
        env_file = os.getenv("ENV_FILE", ".env")
        case_sensitive = False
        extra = "ignore"


@lru_cache()
def get_settings() -> Settings:
    return Settings()


def is_development() -> bool:
    return get_settings().app_env == "development"


def is_production() -> bool:
    return get_settings().app_env == "production"
