# Railway MCP Setup Guide

## Step 1 — Add Railway MCP to Cursor

Open Cursor Settings → go to **MCP Servers** → click **Add Server** and paste:

```json
{
  "railway": {
    "command": "npx",
    "args": ["-y", "@railway/mcp-server"],
    "env": {
      "RAILWAY_API_TOKEN": "YOUR_TOKEN_HERE"
    }
  }
}
```

## Step 2 — Get Your Railway API Token

1. Go to [railway.app](https://railway.app)
2. Click your avatar → **Account Settings** → **Tokens**
3. Click **New Token** — name it `techroadmap-cursor`
4. Copy the token and replace `YOUR_TOKEN_HERE` above
5. Restart Cursor for the MCP server to activate

## Step 3 — Create a Railway Project

1. In Railway dashboard, click **New Project** → **Empty Project**
2. Name it `techroadmap-ai`
3. Click **Add Service** → **GitHub Repo** (if pushing to GitHub) or **Empty Service**
4. In the service settings, set the **Root Directory** to `/` (serving from project root)

## Step 4 — Deploy

Once the Railway MCP is active in Cursor, you can trigger deploys directly from the agent.
The `railway.json` in this folder tells Railway to use `npx serve` to host the static files.

## Step 5 — Connect Namecheap Domain

After first deploy, Railway provides a domain like `techroadmap-ai.up.railway.app`:

1. In Railway project → **Settings** → **Domains** → **Add Custom Domain** → enter `techroadmap.ai`
2. Railway will show a CNAME target value
3. In Namecheap DNS Manager:
   - Delete any existing `@` A record
   - Add CNAME: Host = `@`, Value = the Railway-provided CNAME target
   - TTL = Automatic
4. Propagation takes 5–30 minutes

## Step 6 — Verify

Visit `https://techroadmap.ai` — you should see the TechRoadmap school hub.
