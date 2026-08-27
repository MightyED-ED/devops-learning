#!/bin/bash

echo "================================="
echo "       DEVOPS LEARNING SAVE"
echo "================================="

echo ""
echo "Checking repository..."
git status --porcelain

if [ -z "$(git status --procelain)" ]; then
	echo "Changes have been found"

echo ""
echo "Changes detected:"
git diff --stat

echo ""
read -p "Enter commit message: " MESSAGE

if [ -z "$MESSAGE" ]; then
    echo "ERROR: Commit message cannot be empty."
    exit 1
fi

echo ""
echo "Adding changes..."
git add .

echo ""
echo "Committing..."
git commit -m "$MESSAGE"

if [ $? -ne 0 ]; then
    echo "ERROR: Commit failed."
    exit 1
fi

echo ""
echo "Pushing to GitHub..."
git push

if [ $? -ne 0 ]; then
    echo "ERROR: Push failed."
    exit 1
fi

echo ""
echo "================================="
echo "       SAVE SUCCESSFUL!"
echo "================================="
echo "Commit: $MESSAGE"
echo "GitHub: Updated"
