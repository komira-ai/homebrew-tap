class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.60/mopm-0.0.60-macos-arm64.tar.gz"
      sha256 "6faa3290fe2384bdbab3e3a5c6c8df0159aeeaef23a1e960740934d54bbe2389"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.60/mopm-0.0.60-linux-aarch64.tar.gz"
      sha256 "2a4bc9c731a86069e6ce166aab11ccfbe7281ede4f3514ee0361535722e50d44"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.60/mopm-0.0.60-linux-x86_64.tar.gz"
      sha256 "a4dda585e591370d9980ddccf73c83e85d91b738e4ae4d1cf3e5350dd43c0282"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
