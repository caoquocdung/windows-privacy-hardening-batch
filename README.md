# Windows Privacy Hardening Batch Script

A simple batch script to quickly apply privacy-oriented settings on Windows 10/11 by:

- Disabling Bing (web) Search in the Start Menu
- Disabling Windows Telemetry (Diagnostic Data)
- Disabling Windows Error Reporting

## Features

- Auto-elevates to administrator if needed
- Sets registry values to enforce policies
- Verifies applied settings with clear output

## Usage

1. **Download** `privacy-hardening.bat` from this repo.
2. **Double-click** the batch file (no need to "Run as administrator"—it will auto-elevate).
3. **Review** the console output for verification.
4. **Restart** your PC for all changes to take effect.

## What Does It Do?

- Applies registry settings to disable:
    - Bing/web search suggestions in Windows Search
    - Telemetry/diagnostic data reporting
    - Windows Error Reporting

## Disclaimer

- Some policies may be overridden by domain/organization group policies.
- Use at your own risk.
- Tested on Windows 10 and 11.  
- You can revert changes by deleting the registry keys or setting the values back.

## License

MIT

---

**Feel free to fork, contribute, or open issues!**

