class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.117/tierstore-0.3.117-macos-arm64.tar.gz"
      sha256 "49e66bff30cb76a07becfe795450dd91934e8dc28ce395c44432d81fa2f050cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.117/tierstore-0.3.117-linux-aarch64.tar.gz"
      sha256 "72aa00ed65b7f157c7566e85b8ddc6da3bfe16da3821a21fb3267c0dbf69379c"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.117/tierstore-0.3.117-linux-x86_64.tar.gz"
      sha256 "02a2532f07ea515cca7296e25d49fe3322421a568e460309da7dd8e87091a975"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
