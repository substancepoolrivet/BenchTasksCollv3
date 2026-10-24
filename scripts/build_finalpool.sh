#!/bin/bash
set -e
git config user.name "task-bot"
git config user.email "task-bot@example.com"
git fetch origin '+refs/heads/*:refs/remotes/origin/*'
while IFS='|' read -r branch dev task; do
  [ -z "$branch" ] && continue
  echo "Copying $task from $branch"
  git checkout origin/$branch -- tasks/$dev/$task
  mkdir -p tasks/finalpool
  git mv tasks/$dev/$task tasks/finalpool/$task
done <<'EOF'
fan-dev|fan|coupon-manager
fan-dev|fan|price-tracker
gyy|gyy|blog-engine
gyy|gyy|cms-builder
gyy|gyy|content-scheduler
gyy|gyy|social-publisher
haoze|haoze|video-trimmer
haoze|haoze|subtitle-generator
jl_dev|jl|canvas-grade-automation
jl_dev|jl|email-classification-system
jl_dev|jl|pdf-report-generator
junteng_dev|junteng|booking-system
junteng_dev|junteng|calendar-sync
junteng_dev|junteng|contact-manager
junteng_dev|junteng|shipment-tracker
junteng_dev|junteng|reminder-service
junteng_dev|junteng|product-catalog
junteng_dev|junteng|order-processor
junxian_dev|junxian|translation-api
junxian_dev|junxian|qr-generator
lueyang-dev|lueyang|activity-logger
lueyang-dev|lueyang|crm-system
lueyang-dev|lueyang|deal-manager
lueyang-dev|lueyang|email-campaign
lueyang-dev|lueyang|follow-up-reminder
lueyang-dev|lueyang|sales-pipeline
lv|lv|chat-bot
lv|lv|voice-processor
lv|lv|feedback-collector
lv|lv|sentiment-analyzer
lv|lv|personalization-service
ruige|ruige|canvas-automation
ruige|ruige|data-analytics
ruige|ruige|expense-tracker
ruige|ruige|file-manager
wenshuo-dev|wenshuo|image-processor
wenshuo-dev|wenshuo|search-engine
xiaochen_dev|xiaochen|backup-utility
xiaochen_dev|xiaochen|monitoring-agent
xiaochen_dev|xiaochen|deployment-tool
xiaochen_dev|xiaochen|error-tracker
xiaochen_dev|xiaochen|security-scanner
yuxuan-dev|yuxuan|asset-optimizer
yuxuan-dev|yuxuan|content-manager
yuxuan-dev|yuxuan|task-scheduler
yuxuan-dev|yuxuan|network-analyzer
yuzhen-dev|yuzhen|alert-system
yuzhen-dev|yuzhen|invoice-generator
yuzhen-dev|yuzhen|data-validator
yuzhen-dev|yuzhen|form-builder
yuzhen-dev|yuzhen|permission-manager
yuzhen-dev|yuzhen|payment-processor
zhaochen|zhaochen|load-balancer
zhaochen|zhaochen|template-engine
fan-dev|fan|loyalty-program
fan-dev|fan|discount-calculator
gyy|gyy|tag-manager
gyy|gyy|robots-handler
haoze|haoze|media-organizer
haoze|haoze|streaming-service
jl_dev|jl|customer-feedback-processor
jl_dev|jl|inventory-management
junteng_dev|junteng|help-desk
junxian_dev|junxian|social-connector
lueyang-dev|lueyang|territory-manager
lueyang-dev|lueyang|client-portal
lv|lv|survey-builder
lv|lv|analytics-dashboard
ruige|ruige|web-crawler
ruige|ruige|log-analyzer
wenshuo-dev|wenshuo|cache-optimizer
wenshuo-dev|wenshuo|scheduler
xiaochen_dev|xiaochen|status-checker
xiaochen_dev|xiaochen|health-monitor
yuxuan-dev|yuxuan|sync-service
zhaochen|zhaochen|certificate-manager
zhaochen|zhaochen|storage-manager
EOF
git add -A
git rm -f .github/workflows/build_finalpool.yml scripts/build_finalpool.sh || true
git commit -m "Add implemented tasks to finalpool"
git push origin finalpool
