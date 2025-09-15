/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '1337',
        pathname: '/uploads/**',
      },
      {
        protocol: 'https',
        hostname: 'civall-assets.s3.amazonaws.com',
        pathname: '/**',
      },
    ],
  },
  async rewrites() {
    return [
      {
        source: '/api/strapi/:path*',
        destination: `${process.env.NEXT_PUBLIC_STRAPI_URL || 'http://localhost:1337'}/api/:path*`,
      },
    ];
  },
}

module.exports = nextConfig