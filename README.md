# Aicha Niazy Portfolio Website

This is a static website for Aicha Niazy's portfolio, ready for GitHub Pages deployment.

## Structure

```
website/
├── index.html              # Main homepage
├── assets/
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript files
│   ├── images/            # Images and graphics
│   └── fonts/             # Font files (if any)
├── about/                  # About page (to be created)
├── crm/                    # CRM case studies (to be created)
├── design-systems/         # Design systems page (to be created)
├── projects/               # Projects showcase (to be created)
├── social-media/           # Social media work (to be created)
└── contact/                # Contact page (to be created)
```

## Setup for GitHub Pages

1. Create a new GitHub repository
2. Push this entire `website/` folder to the repository
3. Enable GitHub Pages in repository settings
4. Set source to "Deploy from a branch"
5. Select the main branch and root folder
6. Save the settings

## Custom Domain Setup

1. In GitHub Pages settings, add your custom domain: `www.aichaniazy.com`
2. Configure your domain's DNS:
   - Add a CNAME record pointing `www.aichaniazy.com` to `yourusername.github.io`
   - Or add an A record pointing to GitHub Pages IP addresses
3. Wait for DNS propagation (can take up to 24 hours)

## Features

- Responsive design
- Modern animations and interactions
- Portfolio showcase sections
- Contact information
- Social media integration

## Technologies

- HTML5
- CSS3 with custom animations
- JavaScript for interactions
- GSAP for advanced animations
- Webflow-generated responsive design

## Notes

- All internal links have been updated to point to `https://www.aichaniazy.com/`
- Assets are organized for optimal loading
- Ready for static hosting on GitHub Pages
