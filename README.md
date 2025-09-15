# CivAll Website/CMS Platform

A multi-tenant headless CMS platform for government agencies built with Strapi and Next.js.

## 🚀 Quick Start with GitHub Codespaces

1. Click the green "Code" button above
2. Select "Codespaces" tab
3. Click "Create codespace on main"
4. Wait ~2 minutes for environment setup
5. The development environment will be ready with PostgreSQL, Redis, and Node.js configured

### Starting the Servers

Open two terminals in your codespace:

**Terminal 1 - Strapi CMS:**
```bash
cd cms && npm run develop
```
Access at: http://localhost:1337/admin

**Terminal 2 - Next.js Frontend:**
```bash
cd frontend && npm run dev
```
Access at: http://localhost:3000

## 🏗️ Architecture

```
┌─────────────────────────────────────────┐
│         GitHub Codespaces               │
│                                         │
│  ┌──────────────┐  ┌─────────────────┐ │
│  │  Strapi CMS  │  │  Next.js Front  │ │
│  │  Port: 1337  │  │   Port: 3000    │ │
│  └──────────────┘  └─────────────────┘ │
│           │               │             │
│  ┌────────────────────────────────────┐ │
│  │     PostgreSQL Database            │ │
│  │         Port: 5432                 │ │
│  └────────────────────────────────────┘ │
└─────────────────────────────────────────┘
```

## 📦 Project Structure

```
civall-website-cms/
├── .devcontainer/        # GitHub Codespaces configuration
│   ├── devcontainer.json # Container configuration
│   └── setup.sh         # Automated setup script
├── cms/                 # Strapi backend
│   ├── package.json     # Node dependencies
│   └── .env            # Environment variables (created on setup)
├── frontend/           # Next.js frontend
│   ├── package.json    # Node dependencies
│   ├── next.config.js  # Next.js configuration
│   └── .env.local     # Environment variables (created on setup)
└── README.md          # This file
```

## 🔧 Local Development (Alternative to Codespaces)

### Prerequisites
- Node.js 18+
- PostgreSQL 15+
- npm or yarn

### Setup Steps

1. **Clone the repository:**
```bash
git clone https://github.com/YOUR_USERNAME/civall-website-cms.git
cd civall-website-cms
```

2. **Install PostgreSQL and create database:**
```bash
createdb civall
```

3. **Set up Strapi backend:**
```bash
cd cms
npm install
cp .env.example .env  # Edit with your database credentials
npm run develop
```

4. **Set up Next.js frontend:**
```bash
cd ../frontend
npm install
cp .env.local.example .env.local
npm run dev
```

## 🔑 Environment Variables

### Strapi CMS (.env)
```env
DATABASE_CLIENT=postgres
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_NAME=civall
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=postgres
JWT_SECRET=your-secret-here
ADMIN_JWT_SECRET=your-admin-secret-here
```

### Next.js Frontend (.env.local)
```env
NEXT_PUBLIC_STRAPI_URL=http://localhost:1337
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

## 🏢 Multi-Tenancy

This platform supports multiple government agencies from a single installation:

- Each agency gets a unique subdomain (e.g., `austin.civall.com`)
- Content is automatically filtered by tenant
- PostgreSQL row-level security ensures data isolation
- Shared infrastructure reduces costs

## 🚀 Features

### For Government Agencies
- ✅ WCAG 2.1 AA accessibility compliance
- ✅ Emergency alert system
- ✅ Multi-language support
- ✅ Mobile-responsive templates
- ✅ Form builder for citizen services

### For Developers
- ✅ TypeScript support
- ✅ Hot reload development
- ✅ API-first architecture
- ✅ Automated testing setup
- ✅ CI/CD ready

## 📚 Documentation

- [Strapi Architecture Guide](./docs/strapi-architecture-guide.md)
- [GitHub Codespaces Setup](./docs/github-codespaces-setup.md)
- [Multi-Tenancy Implementation](./docs/multi-tenancy.md)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is proprietary software for CivAll.

## 🆘 Support

For questions or issues:
- Create an issue in this repository
- Contact the development team

## 🎯 Roadmap

### Phase 1 (Q1 2026)
- [ ] Core CMS functionality
- [ ] 5 government templates
- [ ] Basic AI features
- [ ] Accessibility framework

### Phase 2 (Q2 2026)
- [ ] Additional templates
- [ ] Form builder
- [ ] Emergency management
- [ ] Beta customer onboarding

### Phase 3 (Q3-Q4 2026)
- [ ] Multi-site management
- [ ] Advanced workflows
- [ ] Enhanced AI features
- [ ] Platform scaling

---

Built with ❤️ for government digital transformation