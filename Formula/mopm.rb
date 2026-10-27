class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.84/mopm-0.0.84-macos-arm64.tar.gz"
      sha256 "d881119320ad59d9eab6e7e39ba865f9e2868d1b0d49d4cfe168dc2b711142cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.84/mopm-0.0.84-linux-aarch64.tar.gz"
      sha256 "b14c6c0e1729493a19bfc8bd4069f5b400e7b629a11d11c71b3a286bb748daee"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.84/mopm-0.0.84-linux-x86_64.tar.gz"
      sha256 "2831a04fcaac6f048c62a523b6521448e1e53f8c949f65ea47187fd98f74c359"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
