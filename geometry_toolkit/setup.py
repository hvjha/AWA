# setup.py

from setuptools import setup, find_packages

setup(
    name="geometry_toolkit",
    version="1.0.0",
    author="Harsh Vardhan Jha",
    author_email="harshvardhanjha35363@gmail.com",
    description="A Python package providing geometric formulas for 2D shapes and 3D solid figures",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/hvjha/geometry_toolkit",
    packages=find_packages(),

    keywords = [
        "geometry",
        "math",
        "mensuration",
        "3D shapes",
        "2D shapes",
        "geometry toolkit",
        "mathematics"
    ],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Topic :: Scientific/Engineering :: Mathematics",
        "Intended Audience :: Education",
        "Intended Audience :: Developers"
    ],
    python_requires=">=3.7",
)