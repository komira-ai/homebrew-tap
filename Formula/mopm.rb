class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.82/mopm-0.0.82-macos-arm64.tar.gz"
      sha256 "0895e5114ccdf521100179293387b6c7f6f87d5a2c7cbc78c4f0f0a50aeef1d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.82/mopm-0.0.82-linux-aarch64.tar.gz"
      sha256 "cfc174918894a1122bcb7ff94bf57daccd4e99654cb86153c0e37a9622cedd09"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.82/mopm-0.0.82-linux-x86_64.tar.gz"
      sha256 "58f8c464ed691e7af8d1e5f8a38a4e94baf37d25412e3fd32b08f36e4f3da5bf"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
