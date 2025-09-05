# Public Website
[![Azure Static Web Apps](https://img.shields.io/badge/Azure%20Static%20Web%20Apps-Deployed-blue?logo=microsoftazure)](https://azure.microsoft.com/en-us/services/app-service/static/)  
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Faosis/public-website/azure-static-web-apps.yml?branch=main&label=CI%2FCD)](https://github.com/Faosis/public-website/actions/workflows/azure-static-web-apps.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)  

This repository contains the source code and deployment configuration for a personal/portfolio-style website.  
It is designed to be deployed as an **Azure Static Web App** with automated CI/CD via GitHub Actions.

---

## 🚀 Features
- **Static Website** built with HTML, CSS, and JavaScript
- **Portfolio Pages**:
  - Home
  - About
  - Contact
  - Projects
- **Responsive Design** with custom CSS
- **Expandable Project Details** using `<details>` elements
- **Image Assets** (e.g., self-portrait, project screenshots)
- **Azure Deployment** using a Bicep template
- **Automated CI/CD** via GitHub Actions workflow

---

## 📂 Project Structure

- **`public-website/`** — root project folder
  - **`src/`** — website source files  
    - `index.html` — homepage  
    - `about/index.html` — about page  
    - `contact/index.html` — contact page  
    - `projects/index.html` — projects portfolio  
    - `css/style.css` — global styling  
    - `js/main.js` — JavaScript functionality  
    - `images/` — image assets  
  - **`staticwebapp.bicep`** — Azure Static Web App deployment template  
  - **`.github/workflows/azure-static-web-apps.yml`** — GitHub Actions for CI/CD  
  - **`README.md`** — project documentation


---

## 🛠️ Deployment

### Option 1: Deploy via GitHub Actions
1. Push changes to the `main` branch.
2. GitHub Actions (`azure-static-web-apps.yml`) will automatically build and deploy the site to Azure.

### Option 2: Manual Deployment
You can also use the Bicep template:
```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file staticwebapp.bicep
```

## 📌 Usage
- Open `src/index.html` in a browser for local preview.
- Customize `style.css` for design changes.
- Add new pages under `src/` as needed.
- Edit `staticwebapp.bicep` to configure Azure deployment settings.

---

## 🤝 Contributing
If you’d like to contribute:
1. Fork this repo
2. Create a feature branch
3. Commit changes
4. Submit a pull request

---

## 📄 License
This project is licensed under the MIT License.