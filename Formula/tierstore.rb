class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.124/tierstore-0.3.124-macos-arm64.tar.gz"
      sha256 "a2f883aa691cce607c92673d80e41088b63844b8a2c70342e2797cfcad46d39e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.124/tierstore-0.3.124-linux-aarch64.tar.gz"
      sha256 "38592816769f478458df46095dd3a2be71442467e51e29906d097b5dc9267ae6"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.124/tierstore-0.3.124-linux-x86_64.tar.gz"
      sha256 "14af58f3f953a7a2e7b550240ed4f8a894accd676b0dc6ca02ee520c2a32c324"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
