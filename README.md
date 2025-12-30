# Polyseer - See the Future.

## 👉 **Just Use the Hosted Version: [polyseer.xyz](https://polyseer.xyz)** 👈

Seriously, unless you're a developer who wants to modify the code, just use the hosted version. It's free, already set up, and works immediately. No setup required.

---

**Still here?** Okay, you must really want to run this locally. Here's how:

## Quick Start (Development Mode)

This is the simplest way to run Polyseer on your computer. No authentication, no database setup required.

### What You Need
- **Node.js 18+** - [Download here](https://nodejs.org/)
- **pnpm** - Install with: `npm install -g pnpm`
- **OpenAI API Key** - Get from [platform.openai.com](https://platform.openai.com)
- **Valyu API Key** - Get from [platform.valyu.ai](https://platform.valyu.ai)

### Setup (5 minutes)

**1. Clone the repo:**
```bash
git clone https://github.com/yorkeccak/polyseer.git
cd polyseer
```

**2. Install dependencies:**
```bash
pnpm install
```

**3. Create `.env.local` file** in the project root:
```env
NEXT_PUBLIC_APP_MODE=development
OPENAI_API_KEY=sk-proj-...              # Get from platform.openai.com
VALYU_API_KEY=valyu_...                  # Get from platform.valyu.ai
```

**4. Start the app:**
```bash
pnpm dev
```

**5. Open [http://localhost:3000](http://localhost:3000)** and paste any Polymarket or Kalshi URL!

That's it. No authentication, no database required.

### Optional: Save Analysis History (Development Mode)

If you want to save your analyses to view later, set up Supabase:

1. Create a free project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor** → **New Query**
3. Copy/paste everything from `supabase/setup.sql` and click **Run**
4. Go to **Settings** → **API** and add to your `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJ...
```

Restart `pnpm dev` and your analyses will be saved.

---

## Production Setup (Advanced)

Only needed if you want user authentication and public deployment.

Add these to your `.env.local`:
```env
NEXT_PUBLIC_APP_MODE=production
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJ...     # From Supabase Settings → API
VALYU_CLIENT_ID=your-client-id               # Email harvey@valyu.ai for OAuth credentials
VALYU_CLIENT_SECRET=your-client-secret
VALYU_REDIRECT_URI=http://localhost:3000/api/auth/valyu/callback
```

Then `pnpm dev` - users will need to sign in with Valyu.

---

## What is Polyseer?

Prediction markets tell you **what might happen**. Polyseer tells you **why**.

Drop in any **Polymarket or Kalshi** URL and get a structured analysis that breaks down the actual factors driving an outcome. Instead of gut feelings or surface-level takes, you get systematic research across academic papers, news, market data, and expert analysis.

**Core features:**
- Systematic research across academic, web, and market data sources
- Evidence classification and quality scoring
- Mathematical probability aggregation (not just vibes)
- Both sides research to avoid confirmation bias
- Real-time data, not stale information

Built for developers, researchers, and anyone who wants rigorous analysis instead of speculation.

---

## How It Works

Polyseer uses a **multi-agent AI system** to research markets:

1. **Planner Agent** - Breaks down the question into research pathways
2. **Researcher Agents** - Gather evidence from academic papers, news, and market data
3. **Critic Agent** - Identifies gaps and quality issues in the research
4. **Analyst Agent** - Combines evidence using Bayesian probability math
5. **Reporter Agent** - Generates the final human-readable report

### Evidence Quality System

Each piece of evidence is classified by quality:

| Type | Description | Examples |
|------|-------------|----------|
| **A** | Primary Sources | Official documents, press releases, regulatory filings |
| **B** | High-Quality Secondary | Reuters, Bloomberg, WSJ, expert analysis |
| **C** | Standard Secondary | Reputable news with citations |
| **D** | Weak/Speculative | Social media, unverified claims |

### Mathematical Foundation

Polyseer uses **Bayesian probability aggregation** to combine evidence:
- Each piece of evidence has a **log likelihood ratio** based on its quality
- Evidence is adjusted for **correlation** (to avoid double-counting similar sources)
- Final probability is calculated using **mathematical formulas**, not vibes

---

## Tech Stack

- **Next.js 16.1** - React framework with Turbopack (5-14× faster dev)
- **React 19** - Latest React features
- **pnpm** - Fast package manager
- **GPT-5** - Advanced reasoning model
- **Valyu API** - Real-time search across academic papers, news, and market data
- **Supabase** - Database and authentication (production mode only)
- **Polymarket API** - Market data
- **Kalshi API** - Market data

---

## Project Structure

```
polyseer/
├── src/
│   ├── app/                    # Next.js 16 app directory
│   │   ├── api/                # API routes (forecast, featured-markets, etc.)
│   │   ├── analysis/           # Analysis page
│   │   └── page.tsx            # Homepage
│   ├── components/             # React components
│   ├── lib/                    # Core logic
│   │   ├── agents/             # AI agents (planner, researcher, critic, etc.)
│   │   └── tools/              # Search tools (Valyu integration)
│   └── utils/                  # Utilities
├── supabase/
│   └── setup.sql               # One simple SQL file for database setup
├── .env.local                  # Your environment variables
└── README.md                   # This file
```

---

## Troubleshooting

### "Module not found" errors
```bash
rm -rf .next node_modules
pnpm install
pnpm dev
```

### Database connection errors
- Make sure you ran `supabase/setup.sql` in your Supabase SQL editor
- Check your `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` are correct

### Valyu API errors
- Make sure you have `VALYU_API_KEY` in your `.env.local`
- Check you have credits at [platform.valyu.ai](https://platform.valyu.ai)

### Still stuck?
Open an issue on GitHub or email [harvey@valyu.ai](mailto:harvey@valyu.ai)

---

## Legal Disclaimer

**NOT FINANCIAL ADVICE**: Polyseer provides analysis for entertainment and research purposes only. All predictions are probabilistic and should not be used as the sole basis for financial decisions. Always do your own research.

---

## License

MIT License - see [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- **Valyu Network** - Real-time search API and authentication
- **OpenAI** - GPT-5 reasoning capabilities
- **Polymarket** - Prediction market data
- **Kalshi** - Prediction market data
- **Supabase** - Database infrastructure

---

## One More Time: Just Use the Hosted Version

Seriously, go to **[polyseer.xyz](https://polyseer.xyz)** and save yourself the headache.

Unless you want to hack on the code, there's no reason to self-host this. We already did the hard work for you.

---

<div align="center">
  <strong>See the Future. Don't Miss Out.</strong>

  [polyseer.xyz](https://polyseer.xyz)
</div>
