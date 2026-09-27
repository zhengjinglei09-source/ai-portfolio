// 进入视口时淡入，增强浏览节奏
const io = new IntersectionObserver(entries => {
  for (const e of entries) {
    if (e.isIntersecting) {
      e.target.style.opacity = '1';
      e.target.style.transform = 'translateY(0)';
      io.unobserve(e.target);
    }
  }
}, { threshold: 0.08 });

document.querySelectorAll('.metric, .flow li, .card, .step3, .path, .video-card, .takeaway')
  .forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(18px)';
    el.style.transition = 'opacity .55s ease, transform .55s ease';
    io.observe(el);
  });
