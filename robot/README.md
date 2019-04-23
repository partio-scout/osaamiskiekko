# Project template for Robot Framework
This project template follows the following test harness:
```

├── docs/
|       - All keyword documentation for libraries and resource files
├── libs/
|       - All self-made, custom libraries for test cases
├── resources/
|       - Keyword resource files
|       - Expected output files
|       - Sample configuration files
├── tests/
|       - All test cases
├── readme.md
|       – Short documentation of the project
├── run.py
|       – Runner script for all test automation
└── requirements.txt
        – Library- and tool dependencies needed to run test automation
```

`run.py` is the heart of the whole thing, setting up PATHs and other test execution-related configuration. It relies on the four folders (`docs`, `libs`, `resources`, `tests`) being exactly named like they are, being exactly where they are.

TODO:
- Write guide
- run.py: --help