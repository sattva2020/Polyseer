FROM node:22-alpine AS base

# Install pnpm via corepack
RUN corepack enable && corepack prepare pnpm@latest --activate

# Install system deps for better-sqlite3 native build
RUN apk add --no-cache python3 make g++ curl libc6-compat

WORKDIR /app

# ---- Dependencies ----
FROM base AS deps
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --no-frozen-lockfile

# ---- Build ----
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NEXT_TELEMETRY_DISABLED=1

# Build without turbopack (more reliable in Docker)
RUN npx next build

# ---- Production ----
FROM node:22-alpine AS runner
RUN apk add --no-cache libc6-compat curl
WORKDIR /app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

RUN addgroup --system --gid 1001 nodejs && adduser --system --uid 1001 nextjs

# Copy standalone build output
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public

# Create data directory for SQLite (self-hosted mode)
RUN mkdir -p /app/.local-data && chown nextjs:nodejs /app/.local-data

USER nextjs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=10s --retries=3 --start-period=30s \
  CMD curl -f http://localhost:3000/ || exit 1

CMD ["node", "server.js"]
