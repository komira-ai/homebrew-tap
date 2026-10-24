class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.41/mopm-0.0.41-macos-arm64.tar.gz"
      sha256 "2b7a56d7003fe8da6bd7f8dc59f05a4d95d2833ea7b9dd8d22533b1be4889e54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.41/mopm-0.0.41-linux-aarch64.tar.gz"
      sha256 "f8c009b3abbba8d931b0104efdafbd00feef8b410ca063c4b23f058b52bcc5a3"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.41/mopm-0.0.41-linux-x86_64.tar.gz"
      sha256 "efed7d93ad90139dd0a10f4c7b380176a608de53136e895eb6804a030a5739e4"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
