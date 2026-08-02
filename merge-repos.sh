#!/bin/bash

# Multi-Repository Merge Script
# This script merges content from three repositories into the current one

set -e

echo "🔀 Starting multi-repository merge..."

# Configure Git
git config --global user.name "Merge Script"
git config --global user.email "merge@script.local"

# Add remote repositories
echo "📌 Adding remote repositories..."
git remote add vite-react https://github.com/https-www-moraremipanema-com/vite-react-template.git 2>/dev/null || true
git remote add moraremipanema-org https://github.com/https-www-moraremipanema-com/moraremipanema.git 2>/dev/null || true
git remote add moraremipanema-com https://github.com/rodmaldonado/moraremipanema.com.git 2>/dev/null || true

# Fetch all remotes
echo "📥 Fetching from all remotes..."
git fetch vite-react main
git fetch moraremipanema-org main
git fetch moraremipanema-com main

# Merge vite-react-template
echo "🔀 Merging vite-react-template..."
if ! git merge --no-ff vite-react/main -m "Merge vite-react-template"; then
  echo "⚠️  Conflicts detected in vite-react merge. Resolve manually."
  echo "After resolving conflicts, run: git add . && git commit"
  exit 1
fi

# Merge moraremipanema-org
echo "🔀 Merging moraremipanema-org..."
if ! git merge --no-ff moraremipanema-org/main -m "Merge https-www-moraremipanema-com/moraremipanema"; then
  echo "⚠️  Conflicts detected in moraremipanema-org merge. Resolve manually."
  echo "After resolving conflicts, run: git add . && git commit"
  exit 1
fi

# Merge moraremipanema-com
echo "🔀 Merging moraremipanema-com..."
if ! git merge --no-ff moraremipanema-com/main -m "Merge rodmaldonado/moraremipanema.com"; then
  echo "⚠️  Conflicts detected in moraremipanema-com merge. Resolve manually."
  echo "After resolving conflicts, run: git add . && git commit"
  exit 1
fi

# Push the branch
echo "📤 Pushing merge branch..."
git push origin merge-all-repos

echo "✅ Merge complete! All repositories merged successfully."
