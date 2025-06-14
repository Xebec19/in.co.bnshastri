#!/bin/bash
# Backup script for bnshastri.co.in website
# Save this as backup.sh and make it executable with: chmod +x backup.sh

# Configuration
BACKUP_DIR="./backups"
SITE_DIR="."
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILENAME="${BACKUP_DIR}/bnshastri_backup_${TIMESTAMP}.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "${BACKUP_DIR}"

# Create the backup
echo "Creating backup of bnshastri.co.in website..."
tar -czf "${BACKUP_FILENAME}" \
    --exclude="./backups" \
    --exclude="./node_modules" \
    --exclude="./.git" \
    --exclude="./seo-checklist.html" \
    "${SITE_DIR}"

# Check if backup was created successfully
if [ $? -eq 0 ]; then
    echo "Backup created successfully: ${BACKUP_FILENAME}"
    echo "Backup size: $(du -h ${BACKUP_FILENAME} | cut -f1)"
    
    # Remove backups older than 30 days
    find "${BACKUP_DIR}" -name "bnshastri_backup_*.tar.gz" -type f -mtime +30 -delete
    echo "Old backups cleaned up."
else
    echo "Error creating backup."
    exit 1
fi

echo "Backup process completed."
