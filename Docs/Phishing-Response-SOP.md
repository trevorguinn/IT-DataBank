# 📧 Standard Operating Procedure: Phishing Email Response

## Purpose

To define the step-by-step process for identifying, containing, investigating, and reporting a suspected phishing email in an organizational IT environment.

---

## 1. Initial Report from User

- User reports suspicious email via:
  - Help Desk ticket
  - Forward to `phishing@company.com`
  - Phone or in-person report

### Response:
- Instruct user NOT to click links or download attachments
- Ask user to:
  - Forward the email as an attachment (.msg file)
  - Share the time received and sender address
- Open a ticket and begin documentation

---

## 2. Containment

If the user **clicked a link** or **opened an attachment**:
- Disconnect device from the network
- Run endpoint antivirus/malware scan (e.g., Malwarebytes, Defender)
- Preserve logs (browser history, mail logs, file creation/modification timestamps)

---

## 3. Email Header & Link Investigation

### Extract and analyze:
- Sender domain and reply-to address
- Message headers (spoofing attempts, SPF/DKIM/DMARC status)
- Link destinations

### Tools:
- [MXToolbox](https://mxtoolbox.com)
- [Google Safe Browsing](https://transparencyreport.google.com)
- [URLScan.io](https://urlscan.io/)
- [Whois Lookup](https://whois.domaintools.com)

---

## 4. Internal Investigation

- Search for similar messages in mail server logs (Exchange/O365):
  - Use message trace to see who else received it
- Determine scope of exposure

---

## 5. Mitigation Steps

- Remove similar emails from inboxes via O365 Security & Compliance Center (or admin tools)
- Block malicious domains/IPs in:
  - Firewall
  - Email filters
  - DNS filtering tools (e.g., Cisco Umbrella)

---

## 6. User Notification & Training

- If no click occurred: educate user on identifying phishing
- If clicked: require password reset, explain next steps
- Provide phishing prevention handout or link to policy

---

## 7. Escalation (If Needed)

Escalate to InfoSec or Tier II if:
- Malware was executed
- Multiple users were affected
- Credentials or data were compromised

---

## 8. Documentation

Update the ticket with:
- All steps taken
- Tools used
- Timeline of events
- Outcome (contained, escalated, user educated)

Save report to:  
`\\server01\ITSecurity\PhishingIncidents\YYYY-MM-DD_ticket####.md`

---

## ✅ Prevention Recommendations

- Enforce MFA for all accounts
- Train staff quarterly on phishing and social engineering
- Enable email link rewriting/sandboxing where available
- Monitor logs for brute-force login attempts post-incident

---

## 🔐 Reference Policies

- Acceptable Use Policy
- Incident Response Plan
- End User Security Training Guide
